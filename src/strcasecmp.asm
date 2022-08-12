BITS 64
global strcasecmp
SECTION .text

strcasecmp:
    mov r9, 0
    mov r8, 0
    cmp rdi, 0
    jz exit
    cmp rsi, 0
    jz exit

loop:
    cmp byte [rdi], 0
    jz exit_sub
    cmp byte [rsi], 0
    jz exit_sub

first_alpha_cmp:
    mov r10, 0
    mov r11, 0
    cmp byte [rsi], 65
    jl second_alpha_cmp
    cmp byte [rsi], 90
    jg second_alpha_cmp
    mov r10b, 32
    
second_alpha_cmp:
    cmp byte [rdi], 65
    jl loop_next
    cmp byte [rdi], 90
    jg loop_next
    mov r11b, 32

loop_next:
    mov r9b, byte [rsi]
    add r9b, r10b
    mov r8b, byte [rdi]
    add r8b, r11b
    cmp r8b, r9b
    jnz exit_sub
    inc rdi
    inc rsi
    jmp loop

exit_sub:
    mov r8b, byte [rdi]
    mov r9b, byte [rsi]
    sub r8, r9
    jmp exit

exit:
    mov rax, r8
    ret
