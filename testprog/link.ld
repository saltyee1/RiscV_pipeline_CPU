OUTPUT_ARCH(riscv)
ENTRY(_start)

SECTIONS{
    . = 0x0000;
    .text :
    {
        *(.text)
        *(.text.*)
        text_end = .;
    }

    .rodata : AT(text_end)
    {
        *(.rodata)
        rodata_end = .;
    }

    .data : AT(rodata_end)
    {
        *(.data)
        data_end = .;
    }

    .bss : AT(data_end)
    {
        *(.bss)
        bss_end = .;
    }
}
