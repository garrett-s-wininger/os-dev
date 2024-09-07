ENTRY(_start)
MEMORY {
    ROM (RX) : ORIGIN = 0x40100000, LENGTH = 1M
    RAM (RW) : ORIGIN = 0x40200000, LENGTH = 1M
}
SECTIONS {
    . = 0x40100000;
    .startup . : { boot.o(.text) } > ROM
    .text : { *(.text) } > ROM
    .data : { *(.data) } > RAM
    .bss : { *(.bss) } > RAM
    . = ALIGN(8);
    . += 0x1000;
    stack_top = .;
}
