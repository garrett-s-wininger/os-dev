all: kernel

ensure-arch:
ifndef ARCH
	$(error ARCH must be defined so that a proper OS is built or cleaned)
endif

kernel: ensure-arch
	make -C arch/$(ARCH)

run: kernel
	make -C arch/$(ARCH) run

clean: ensure-arch
	make -C arch/$(ARCH) clean
