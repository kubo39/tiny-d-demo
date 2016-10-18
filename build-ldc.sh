#!/bin/bash

set -e

for d in ldc2 nasm; do
    which $d >/dev/null || (echo "Can't find $d, needed to build"; exit 1)
done

ldc2 --version | head -1
echo

set -x

ldc2 -Os -c tinybin.d
ld tinybin.o -o payload -T script.ld --gc-section
objcopy -j combined -O binary payload payload.bin
ENTRY=$(nm -f posix payload | grep 'main' | awk '{print $3}')
nasm -f bin -o tinybin -D entry=0x$ENTRY elf.s
chmod +x tinybin
hexdump -C tinybin
wc -c tinybin
./tinybin