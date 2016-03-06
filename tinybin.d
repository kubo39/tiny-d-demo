extern (C) void main()
{
  asm
  {
    naked;
    mov RAX, 1;  // WRITE
    mov RDI, 1;  // STDOUT
    mov RSI, 0x400008;
    mov RDX, 7;
    syscall;
    mov RAX, 60;  // EXIT
    xor RDI, RDI;
    syscall;
  }
}
