extern adgangskode_check
extern _getch, _printf
global main
global access_denied
global continue_game

section .data
ok db "Adgang givet",0
fejl db "Adgang ikke givet", 0

section .text

main:
    call adgangskode_check
    ret

access_denied:
    push fejl
    call _printf
    add esp, 4
    call _getch
    ret

continue_game:
    push ok
    call _printf
    add esp, 4
    call _getch
    ret
