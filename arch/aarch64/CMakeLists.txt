cmake_minimum_required(VERSION 3.30)
project(Aarch64Kernel C ASM)

add_executable(aarch64-kernel boot.s kernel.c)

find_program(AARCH64_EMULATOR qemu-system-aarch64)

if(AARCH64_EMULATOR)
    add_custom_target(
        aarch64-emulate
        DEPENDS aarch64-kernel
        COMMAND ${AARCH64_EMULATOR} -machine virt -cpu cortex-a57 -nographic -kernel $<TARGET_FILE:aarch64-kernel>)
endif()
