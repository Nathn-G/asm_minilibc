BITS 64
global ffs
SECTION .text

ffs:
    mov r8, 0
    mov r9, 2147483648
    mov r10, 32

loop:
    mov edx, 0
    mov eax, edi ; dividend
    mov ecx, r9d ; divisor
    div ecx
    cmp eax, 0
    jnz change_min
loop_next:
    mov edi, edx
    cmp edi, 0
    jz exit
    mov edx, 0
    mov eax, r9d ; dividend
    mov ecx, 2 ; divisor
    div ecx
    mov r9d, eax
    dec r10
    jmp loop

change_min:
    mov r8, r10
    jmp loop_next

exit:
    mov rax, r8
    ret