cmake_minimum_required(VERSION 3.30)
project(x86Kernel C ASM)

add_executable(x86-kernel boot.s kernel.c)
target_compile_options(x86-kernel PRIVATE -Wall -Werror --start-no-unused-arguments -ffreestanding --end-no-unused-arguments)
target_link_options(x86-kernel PRIVATE -Tlinker.ld -nostdlib)

find_program(EMULATOR qemu-system-i386)
find_program(MULTIBOOT_VALIDATION grub2-file)

if(EMULATOR)
    add_custom_target(
        x86-emulate
        DEPENDS x86-kernel
        COMMAND ${EMULATOR} -kernel $<TARGET_FILE:x86-kernel>)
endif()

if(MULTIBOOT_VALIDATION)
    add_custom_command(
        TARGET x86-kernel
        POST_BUILD
        COMMAND ${MULTIBOOT_VALIDATION}
        ARGS --is-x86-multiboot $<TARGET_FILE:x86-kernel>)
endif()
