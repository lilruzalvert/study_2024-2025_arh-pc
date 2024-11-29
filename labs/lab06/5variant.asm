%include 'in_out.asm'

SECTION .data
expr: DB 'Результат: ', 0
input_msg: DB 'Введите значение x: ', 0
SECTION .bss
x_input resb 10

SECTION .text
GLOBAL _start
_start:
    mov eax, input_msg
    call sprintLF
    mov ecx, x_input
    mov edx, 10
    call sread
    mov eax, x_input
    call atoi
    mov ebx, eax
    imul ebx, 9
    sub ebx, 8
    xor edx, edx
    mov eax, ebx
    mov ebx, 8
    div ebx
    mov edi, eax
    mov eax, expr
    call sprint
    mov eax, edi
    call iprintLF
    call quit

