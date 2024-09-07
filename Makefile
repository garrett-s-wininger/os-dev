all: kernel

kernel:
	aarch64-elf-as boot.s -o boot.o
	aarch64-elf-gcc -ffreestanding -c kernel.c -o kernel.o
	aarch64-elf-ld -nostdlib -Tlinker.ld boot.o kernel.o -o kernel.elf

run: kernel
	qemu-system-aarch64 -machine virt -cpu cortex-a57 -kernel kernel.elf -nographic

clean:
	rm -f *.o *.elf
