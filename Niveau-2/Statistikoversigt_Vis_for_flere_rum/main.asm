section .data
    ; Statistikvariabler (én byte hver)
    rum1_pass db 3
    rum1_fail db 1

    rum2_pass db 0
    rum2_fail db 2

    rum3_pass db 1
    rum3_fail db 0

    ; printf-format
    fmt_line db "Rum %d: Pass=%d, Fail=%d", 10, 0

section .text
    global _main
    extern _printf
    extern _getch
    extern _exit

_main:
    ; Rum 1
    movzx eax, byte [rum1_pass]
    push eax
    movzx eax, byte [rum1_fail]
    push eax
    push dword 1
    push fmt_line
    call _printf
    add esp, 16


    ; Rum 2
    movzx eax, byte [rum2_pass]
    push eax
    movzx eax, byte [rum2_fail]
    push eax
    push dword 2
    push fmt_line
    call _printf
    add esp, 16

    ; Rum 3
    movzx eax, byte [rum3_pass]
    push eax
    movzx eax, byte [rum3_fail]
    push eax
    push dword 3
    push fmt_line
    call _printf
    add esp, 16

    ; Vent på tast og afslut
    call _getch
    push 0
    call _exit
