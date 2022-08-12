BITS 64
global memcpy
SECTION .text

memcpy:
    mov r8, rdi
    cmp rdi, 0
    jz exit
    cmp rsi, 0
    jz exit
    mov r9, 0
    jmp loop

loop:
    cmp rdx, 0
    jz exit
    dec rdx
    mov r10b, byte [rsi + r9]
    mov [rdi], r10b
    inc rdi
    inc r9
    jmp loop

exit:
    mov rax, r8
    ret