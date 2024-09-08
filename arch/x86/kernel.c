#include <stdint.h>

#define VGA_WIDTH 80
#define VGA_HEIGHT 25

volatile uint16_t* vga = (uint16_t*)0xB8000;

void vga_clear_screen(void) {
    for (unsigned int x = 0; x < VGA_WIDTH; ++x) {
        for (unsigned int y = 0; y < VGA_HEIGHT; ++y) {
            vga[(VGA_WIDTH * y) + x] = 0;
        }
    }
}

void kmain(void) {
    vga_clear_screen();

    for (;;) {
        // Hang on purpose
    }
}
