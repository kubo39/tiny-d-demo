extern (C):

version(DigitalMars)
{
    __gshared void _d_dso_registry() {}
    __gshared void* __dmd_personality_v0;
}
version(Linux)
{
  enum WRITE = 1;
  enum EXIT = 60;
}
version(FreeBSD)
{
  __gshared void* __start_minfo;
  __gshared void* __stop_minfo;

  enum WRITE = 4;
  enum EXIT = 1;
}

void main()
{
    asm
    {
        naked;
        mov EAX, WRITE;
        mov EDI, 1;  // STDOUT
        mov ESI, 0x400008;
        mov EDX, 7;
        syscall;
        mov EAX, EXIT;
        xor EDI, EDI;
        syscall;
    }
}
