BITS 64
global strlen
SECTION .text

strlen:
    mov r8, 0
    cmp rdi, 0
    jz exit
    jmp loop

loop:
    cmp [rdi], byte 0
    jz exit
    inc rdi
    inc r8
    jmp loop

exit:
    mov rax, r8
    ret
