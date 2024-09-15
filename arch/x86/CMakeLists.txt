cmake_minimum_required(VERSION 3.30)
project(x86Kernel C ASM)

add_executable(x86-kernel boot.s kernel.c)

find_program(x86_EMULATOR qemu-system-i386)
find_program(MULTIBOOT1_VALIDATION grub2-file)

if(x86_EMULATOR)
    add_custom_target(
        x86-emulate
        DEPENDS x86-kernel
        COMMAND ${x86_EMULATOR} -kernel $<TARGET_FILE:x86-kernel>)
endif()

if(MULTIBOOT1_VALIDATION)
    add_custom_command(
        TARGET x86-kernel
        POST_BUILD
        COMMAND ${MULTIBOOT1_VALIDATION}
        ARGS --is-x86-multiboot $<TARGET_FILE:x86-kernel>)
endif()
