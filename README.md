# Tiny D demo

## Demo

```
% ./build.sh
DMD64 D Compiler v2.068.0

+ dmd -c tinybin.d
+ gcc tinybin.o -o payload -e _Dmain -T script.ld -Xlinker --gc-section -l:libphobos2.a -lpthread
+ objcopy -j combined -O binary payload payload.bin
++ awk '{print $3}'
++ grep _Dmain
++ nm -f posix payload
+ ENTRY=0000000000400078
+ nasm -f bin -o tinybin -D entry=0x0000000000400078 elf.s
+ chmod +x tinybin
+ hexdump -C tinybin
00000000  7f 45 4c 46 02 01 01 00  48 65 6c 6c 6f 21 0a 00  |.ELF....Hello!..|
00000010  02 00 3e 00 01 00 00 00  78 00 40 00 00 00 00 00  |..>.....x.@.....|
00000020  40 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |@...............|
00000030  00 00 00 00 40 00 38 00  01 00 00 00 00 00 00 00  |....@.8.........|
00000040  01 00 00 00 07 00 00 00  00 00 00 00 00 00 00 00  |................|
00000050  00 00 40 00 00 00 00 00  00 00 40 00 00 00 00 00  |..@.......@.....|
00000060  a8 00 00 00 00 00 00 00  a8 00 00 00 00 00 00 00  |................|
00000070  00 10 00 00 00 00 00 00  55 48 8b ec b8 01 00 00  |........UH......|
00000080  00 bf 01 00 00 00 be 08  00 40 00 ba 07 00 00 00  |.........@......|
00000090  0f 05 b8 3c 00 00 00 bf  00 00 00 00 0f 05 31 c0  |...<..........1.|
000000a0  5d c3 66 0f 1f 44 00 00                           |].f..D..|
000000a8
+ wc -c tinybin
168 tinybin
```

## Other Language Implementations

- [Rust](http://mainisusuallyafunction.blogspot.de/2015/01/151-byte-static-linux-binary-in-rust.html)

- [Nim](http://hookrace.net/blog/nim-binary-size/)
