BITS 64
global memmove
SECTION .text

memmove:
    mov r8, rdi
    cmp rdi, 0
    jz exit
    cmp rsi, 0
    jz exit
    mov r9, 0
    mov r10, rsi
    cmp rdi, r10
    jae inverse_loop
    jmp loop

inverse_loop:
    cmp rdx, 0
    jz exit
    mov r10b, byte [rsi + rdx - 1]
    mov [rdi + rdx - 1], r10b
    dec rdx
    jmp inverse_loop

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