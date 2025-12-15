version(LDC)
{
    import ldc.attributes;
    import ldc.llvmasm;
}
version(DigitalMars)
{
    struct naked {}
}

extern (C):

version (linux)
{
    enum WRITE = 1;
    enum EXIT = 60;
}
version (FreeBSD)
{
    __gshared void* __start_minfo;
    __gshared void* __stop_minfo;

    enum WRITE = 4;
    enum EXIT = 1;
}

@naked
void main() pure nothrow @nogc
{
    version(DigitalMars)
    {
        asm pure nothrow @nogc
        {
            naked;
            mov EAX, WRITE;
            mov EDI, 1; // STDOUT
            mov ESI, 0x400008;
            mov EDX, 7;
            syscall;
            mov EAX, EXIT;
            xor EDI, EDI;
            syscall;
        }
    }
    version(LDC)
    {
        __asm(`
            mov $$1, %eax
            mov $$1, %edi
            mov $$0x400008, %esi
            mov $$7, %edx
            syscall
            mov $$60, %eax
            xor %edi, %edi
            syscall
        `, "");
    }
    assert(false);
}
