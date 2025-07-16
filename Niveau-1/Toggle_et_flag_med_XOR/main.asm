section .data
    flag db 1                   ; initial værdi
    format db "Flag: %d", 10, 0 ; printf format

section .text
    global _main
    extern _printf
    extern _getch
    extern _exit

_main:
    ; vis gammel værdi
    xor eax, eax
    mov al, [flag]
    push eax
    push format
    call _printf
    add esp, 8

    ; toggle
    xor byte [flag], 1

    ; vis ny værdi
    xor eax, eax
    mov al, [flag]
    push eax
    push format
    call _printf
    add esp, 8

    call _getch
    push 0
    call _exit
