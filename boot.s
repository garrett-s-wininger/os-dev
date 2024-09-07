.global _start
_start:
    LDR X30, =stack_top
    MOV SP, X30
    BL kmain
    B .
