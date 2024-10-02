SECTIONS
{
    . = 0x40000000;       /* Load address */
    .text : { *(.text) }
    .rodata : { *(.rodata*) }
    .data : { *(.data) }
    .bss : { *(.bss COMMON) }
}
