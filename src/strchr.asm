BITS 64
global strchr
global index
SECTION .text

index:
strchr:
    mov r8, 0
    cmp rdi, 0
    jz exit
    jmp loop

loop:
    cmp [rdi], sil
    jz exit
    cmp [rdi], byte 0
    jz notfound
    inc rdi
    inc r8
    jmp loop

notfound:
    mov rax, 0
    ret
exit:
    mov rax, rdi
    ret