# Tiny D demo

## Demo

* DMD

```
$ ./build-dmd.sh
DMD64 D Compiler v2.088.0
Copyright (C) 1999-2019 by The D Language Foundation, All Rights Reserved written by Walter Bright

+ dmd -c tinybin.d
+ ld tinybin.o -o payload -T script.ld --gc-section
+ objcopy -j combined -O binary payload payload.bin
++ nm --format=posix payload
++ grep main
++ awk '{print $3}'
+ ENTRY=0000000000400070
+ nasm -f bin -o tinybin -D entry=0x0000000000400070 elf.s
+ chmod u+x tinybin
+ hexdump -C tinybin
00000000  7f 45 4c 46 02 01 01 09  48 65 6c 6c 6f 21 0a 00  |.ELF....Hello!..|
00000010  02 00 3e 00 01 00 00 00  70 00 40 00 00 00 00 00  |..>.....p.@.....|
00000020  38 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |8...............|
00000030  00 00 00 00 38 00 38 00  01 00 00 00 07 00 00 00  |....8.8.........|
00000040  00 00 00 00 00 00 00 00  00 00 40 00 00 00 00 00  |..........@.....|
00000050  00 00 40 00 00 00 00 00  90 00 00 00 00 00 00 00  |..@.............|
00000060  90 00 00 00 00 00 00 00  00 10 00 00 00 00 00 00  |................|
00000070  b8 01 00 00 00 bf 01 00  00 00 be 08 00 40 00 ba  |.............@..|
00000080  07 00 00 00 0f 05 b8 3c  00 00 00 31 ff 0f 05 00  |.......<...1....|
00000090
+ wc -c tinybin
144 tinybin
+ ./tinybin
Hello!
```

* LDC

```
$ ./build-ldc.sh
LDC - the LLVM D compiler (1.17.0):

+ ldc2 -Os -c tinybin.d
+ ld tinybin.o -o payload -T script.ld --gc-section
+ objcopy -j combined -O binary payload payload.bin
++ nm --format=posix payload
++ grep main
++ awk '{print $3}'
+ ENTRY=0000000000400070
+ nasm -f bin -o tinybin -D entry=0x0000000000400070 elf.s
+ chmod u+x tinybin
+ hexdump -C tinybin
00000000  7f 45 4c 46 02 01 01 09  48 65 6c 6c 6f 21 0a 00  |.ELF....Hello!..|
00000010  02 00 3e 00 01 00 00 00  70 00 40 00 00 00 00 00  |..>.....p.@.....|
00000020  38 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |8...............|
00000030  00 00 00 00 38 00 38 00  01 00 00 00 07 00 00 00  |....8.8.........|
00000040  00 00 00 00 00 00 00 00  00 00 40 00 00 00 00 00  |..........@.....|
00000050  00 00 40 00 00 00 00 00  8f 00 00 00 00 00 00 00  |..@.............|
00000060  8f 00 00 00 00 00 00 00  00 10 00 00 00 00 00 00  |................|
00000070  b8 01 00 00 00 bf 01 00  00 00 be 08 00 40 00 ba  |.............@..|
00000080  07 00 00 00 0f 05 b8 3c  00 00 00 31 ff 0f 05     |.......<...1...|
0000008f
+ wc -c tinybin
143 tinybin
+ ./tinybin
Hello!
```

## Other Language Implementations

- [Rust](http://mainisusuallyafunction.blogspot.de/2015/01/151-byte-static-linux-binary-in-rust.html)

- [Nim](http://hookrace.net/blog/nim-binary-size/)
