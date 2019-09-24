#!/usr/bin/env bash

set -e

for d in dmd nasm; do
    command -v $d >/dev/null || (echo "Can't find $d, needed to build"; exit 1)
done

dmd --version
echo

set -x

dmd -c tinybin.d
ld tinybin.o -o payload -T script.ld --gc-section
objcopy -j combined -O binary payload payload.bin
ENTRY=$(nm --format=posix payload | grep 'main' | awk '{print $3}')
nasm -f bin -o tinybin -D entry=0x$ENTRY elf.s
chmod u+x tinybin
hexdump -C tinybin
wc -c tinybin
./tinybin
