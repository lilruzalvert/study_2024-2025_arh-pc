%include 'in_out.asm'

SECTION .data
msg_func db "Функция: f(x)=4x+3", 10, 0
msg db "Результат: ", 0

SECTION .text
GLOBAL _start

_start:
    mov eax, msg_func
    call sprint
    pop ecx
    sub ecx, 1
    mov esi, 0

next:
    cmp ecx, 0
    jz _end
    pop eax
    call atoi
    push eax
    call calculate_function
    add esi, eax
    dec ecx
    jmp next

_end:
    mov eax, msg
    call sprint
    mov eax, esi
    call iprintLF
    call quit

calculate_function:
    pop eax
    lea eax, [eax*4+3]
    ret
