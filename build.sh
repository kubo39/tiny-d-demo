#!/bin/bash

set -e

for d in dmd nasm; do
    which $d >/dev/null || (echo "Can't find $d, needed to build"; exit 1)
done

dmd | head -1
echo

set -x

dmd -c tinybin.d
gcc tinybin.o -o payload -e _Dmain -T script.ld -Xlinker --gc-section -l:libphobos2.a -lpthread
objcopy -j combined -O binary payload payload.bin
ENTRY=$(nm -f posix payload | grep '_Dmain' | awk '{print $3}')
nasm -f bin -o tinybin -D entry=0x$ENTRY elf.s
chmod +x tinybin
hd tinybin
wc -c tinybin
