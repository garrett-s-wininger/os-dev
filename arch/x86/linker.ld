ENTRY(_start)
SECTIONS {
    . = 2M;

    .text BLOCK(4K) : ALIGN(4K) {
        KEEP(*(.multiboot))
        *(.text)
        KEEP(*(.note.gnu.build-id))
    }
    .rodata BLOCK(4K) : ALIGN(4K) {
        *(.rodata)
    }
    .data BLOCK(4K) : ALIGN(4K) {
        *(.data)
    }
    .bss BLOCK(4K) : ALIGN(4K) {
        *(COMMON)
        *(.bss)
    }
}
