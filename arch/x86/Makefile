CFLAGS=-ffreestanding
CC=clang -target i386-none-elf
LDFLAGS=-nostdlib -Tlinker.ld

KERNEL_SOURCES=kernel.c
ASSEMBLY_SOURCES=boot.s

KERNEL_OBJECTS=$(KERNEL_SOURCES:.c=.o)
ASSEMBLY_OBJECTS=$(ASSEMBLY_SOURCES:.s=.o)

KERNEL_OUTPUT=kernel.bin

all: $(KERNEL_OUTPUT)

$(KERNEL_OUTPUT):
	$(CC) $(CFLAGS) -c $(ASSEMBLY_SOURCES) $(KERNEL_SOURCES)
	$(CC) $(LDFLAGS) $(ASSEMBLY_OBJECTS) $(KERNEL_OBJECTS) -o $(KERNEL_OUTPUT)
	grub2-file --is-x86-multiboot $(KERNEL_OUTPUT)

run: $(KERNEL_OUTPUT)
	qemu-system-x86_64 -kernel $^

clean:
	rm -f *.o *.elf *.bin
