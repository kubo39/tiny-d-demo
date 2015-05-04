void write(size_t p, size_t len)
{
  asm
  {
    mov RAX, 1;  // WRITE
    mov RDI, 1;  // STDOUT
    mov RSI, p[RBP];
    mov RDX, len[RBP];
    syscall;
  }
}

void exit()
{
  asm
  {
    mov RAX, 60;  // EXIT
    mov RDI, 0;
    syscall;
  }
}

void main()
{
  immutable(char)[7] buf = "Hello!\n";
  write(cast(size_t) buf.ptr, 7);
  exit();
}
