BITS 64
global memset
SECTION .text

memset:
    mov r8, rdi
    cmp rdi, 0
    jz exit
    jmp loop

loop:
    cmp rdx, 0
    jz exit
    dec rdx
    mov [rdi], esi
    inc rdi
    jmp loop

exit:
    mov rax, r8
    ret