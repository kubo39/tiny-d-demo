extern (C):

version(DigitalMars)
{
    __gshared void _d_dso_registry() {}
    __gshared void* __dmd_personality_v0;
}

void main()
{
    asm
    {
        naked;
        mov EAX, 1;  // WRITE
        mov EDI, 1;  // STDOUT
        mov ESI, 0x400008;
        mov EDX, 7;
        syscall;
        mov EAX, 60;  // EXIT
        xor EDI, EDI;
        syscall;
    }
}
