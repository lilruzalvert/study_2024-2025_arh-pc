%include 'in_out.asm'

SECTION .data
msg_input_x: DB 'Введите значение x: ', 0
msg_input_a: DB 'Введите значение a: ', 0
msg_result: DB 'Результат вычислений: ', 0

SECTION .bss
x: RESD 1
a: RESD 1
result: RESD 1

SECTION .text
GLOBAL _start

_start:
    ; Ввод x
    mov eax, msg_input_x
    call sprint

    mov ecx, x
    mov edx, 10
    call sread

    mov eax, x
    call atoi
    mov [x], eax

    ; Ввод a
    mov eax, msg_input_a
    call sprint

    mov ecx, a
    mov edx, 10
    call sread

    mov eax, a
    call atoi
    mov [a], eax

    ; Вычисление f(x)
    mov eax, [x]
    mov ebx, [a]
    cmp eax, ebx
    jle .less_or_equal

    ; f(x) = 2 * (x - a)
    sub eax, ebx
    shl eax, 1
    mov [result], eax
    jmp .print_result

.less_or_equal:
    ; f(x) = 15
    mov eax, 15
    mov [result], eax

.print_result:
    mov eax, msg_result
    call sprint

    mov eax, [result]
    call iprintLF
    call quit
