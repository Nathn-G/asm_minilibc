BITS 64
global strncmp
SECTION .text

strncmp:
    mov r9, 0
    mov r8, 0
    cmp rdi, 0
    jz exit
    cmp rsi, 0
    jz exit

loop:
    cmp rdx, 1
    jz exit_sub
    cmp byte [rdi], 0
    jz exit_sub
    cmp byte [rsi], 0
    jz exit_sub
    mov r9b, byte [rsi]
    cmp byte [rdi], r9b
    jnz exit_sub
    inc rdi
    inc rsi
    dec rdx
    jmp loop

exit_sub:
    mov r8b, byte [rdi]
    mov r9b, byte [rsi]
    sub r8, r9
    jmp exit

exit:
    mov rax, r8
    ret