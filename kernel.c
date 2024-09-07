#include <stdint.h>

volatile uint8_t *uart = (uint8_t *) 0x09000000;

void kmain(void) {
    *uart = 'A';
}
