BITS 64
global strpbrk
SECTION .text

strpbrk:
    cmp rdi, 0
    jz exit
    jmp loop_init

loop_init:
    mov r9, -1
loop:
    inc r9
    cmp byte [rsi + r9], 0
    jz loop_next
    mov r10b, [rsi + r9]
    cmp [rdi], r10b
    jz exit
    cmp byte [rsi + r9], 0
    jnz loop
loop_next:
    cmp [rdi], byte 0
    jz notfound
    inc rdi
    jmp loop_init

notfound:
    mov rax, 0
    ret
exit:
    mov rax, rdi
    ret