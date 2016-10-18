extern (C) void main()
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
