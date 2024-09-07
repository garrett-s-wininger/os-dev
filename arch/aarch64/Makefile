CC=clang -target aarch64-none-elf
CFLAGS=-ffreestanding
LDFLAGS=-nostdlib -Tlinker.ld

KERNEL_SOURCES=kernel.c
ASSEMBLY_SOURCES=boot.s

KERNEL_OBJECTS=$(KERNEL_SOURCES:.c=.o)
ASSEMBLY_OBJECTS=$(ASSEMBLY_SOURCES:.s=.o)

KERNEL_OUTPUT=kernel.elf

all: $(KERNEL_OUTPUT)

$(KERNEL_OUTPUT):
	$(CC) $(CFLAGS) -c $(ASSEMBLY_SOURCES) $(KERNEL_SOURCES)
	$(CC) $(LDFLAGS) $(ASSEMBLY_OBJECTS) $(KERNEL_OBJECTS) -o $(KERNEL_OUTPUT)

run: $(KERNEL_OUTPUT)
	qemu-system-aarch64 -machine virt -cpu cortex-a57 -kernel $^ -nographic

clean:
	rm -f *.o *.elf
