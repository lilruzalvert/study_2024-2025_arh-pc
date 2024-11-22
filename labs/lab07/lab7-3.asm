%include 'in_out.asm' ; подключение внешнего файла

SECTION .data
msg2: DB 'Наименьшее значение: ', 0
var_a: DD 54
var_b: DD 62
var_c: DD 87

SECTION .bss
min: RESD 1

SECTION .text
GLOBAL _start

_start:
    ; Найти минимум среди A, B и C
    mov eax, [var_a]
    mov [min], eax

    cmp eax, [var_b]
    jle .check_c
    mov eax, [var_b]
    mov [min], eax

.check_c:
    cmp eax, [var_c]
    jle .print_result
    mov eax, [var_c]
    mov [min], eax

.print_result:
    mov eax, msg2
    call sprint

    mov eax, [min]
    call iprintLF
    call quit
