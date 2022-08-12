BITS 64
global strcspn
SECTION .text

strcspn:
    mov r9, 0
    cmp rdi, 0
    jz exit
    jmp loop

inc_loop:
    inc rdi
    inc r9
loop:
    mov r10b, byte [rsi]
    cmp byte [rdi], r10b
    jz exit
    cmp [rdi], byte 0
    jz exit

find:
    mov r11, -1
find_next:
    inc r11
    cmp [rsi + r11], byte 0
    jz inc_loop
    mov r10b, byte [rsi + r11]
    cmp byte [rdi], r10b
    jz exit
    jmp find_next
exit:
    mov rax, r9
    ret