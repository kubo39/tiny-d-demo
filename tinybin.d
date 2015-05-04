void main()
{
  immutable(char)[7] buf = "Hello!\n";
  auto p = cast(size_t) buf.ptr;
  asm
  {
    mov RAX, 1;  // WRITE
    mov RDI, 1;  // STDOUT
    mov RSI, p;
    mov RDX, 7;
    syscall;
    mov RAX, 60;  // EXIT
    mov RDI, 0;
    syscall;
  }
}
