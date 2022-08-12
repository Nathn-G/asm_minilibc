BITS 64
global strrchr
global rindex
SECTION .text

rindex
strrchr:
    mov r8, 0
    mov r9, 0
    cmp rdi, 0
    jz exit
    jmp loop

loop:
    cmp [rdi], sil
    jz find
    cmp [rdi], byte 0
    jz exit
    inc rdi
    inc r8
    jmp loop

find:
    mov r9, rdi
    cmp [rdi], byte 0
    jz exit
    inc rdi
    inc r8
    jmp loop
exit:
    mov rax, r9
    ret