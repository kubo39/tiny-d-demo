void main()
{
  asm
  {
    mov RAX, 1;  // WRITE
    mov RDI, 1;  // STDOUT
    mov RSI, 0x400008;
    mov RDX, 7;
    syscall;
    mov RAX, 60;  // EXIT
    mov RDI, 0;
    syscall;
  }
}
