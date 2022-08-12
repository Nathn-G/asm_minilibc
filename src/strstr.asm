BITS 64
global strstr
SECTION .text

strstr:
    mov r9, 0
    cmp rdi, 0
    jz exit
    cmp [rsi], byte 0
    jz find
    jmp loop

loop:
    mov r9, 0
    mov r10b, byte [rsi]
    cmp byte [rdi], r10b
    jz find
    cmp [rdi], byte 0
    jz exit
    inc rdi
    jmp loop

find:
    mov r9, rdi
    mov r11, -1
find_next:
    inc r11
    cmp [rsi + r11], byte 0
    jz exit
    cmp [rdi + r11], byte 0
    jz inc_rdi_loop
    mov r10b, byte [rsi + r11]
    cmp byte [rdi + r11], r10b
    jz find_next
    jmp inc_rdi_loop
exit:
    mov rax, r9
    ret

inc_rdi_loop:
    inc rdi
    jmp loop