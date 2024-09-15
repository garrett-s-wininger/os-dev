cmake_minimum_required(VERSION 3.30)
project(Aarch64Kernel C ASM)

add_executable(aarch64-kernel boot.s kernel.c)
target_compile_options(aarch64-kernel PRIVATE -Wall -Werror --start-no-unused-arguments -ffreestanding --end-no-unused-arguments)
target_link_options(aarch64-kernel PRIVATE -Tlinker.ld -nostdlib)

find_program(EMULATOR qemu-system-aarch64)

if(EMULATOR)
    add_custom_target(
        aarch64-emulate
        DEPENDS aarch64-kernel
        COMMAND ${EMULATOR} -machine virt -cpu cortex-a57 -nographic -kernel $<TARGET_FILE:aarch64-kernel>)
endif()
