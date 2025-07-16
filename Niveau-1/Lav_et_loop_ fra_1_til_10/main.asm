section .data
    format db "Tal: %d", 10, 0     ; "%d\n"

section .text
    global _main
    extern _printf
    extern _getch
    extern _exit

_main:
    mov esi, 1           ; Start ved 1

.loop:
    mov eax, esi         ; printf får tallet i eax
    push eax
    push format
    call _printf
    add esp, 8           ; ryd stacken

    inc esi
    cmp esi, 11          ; så længe mindre end 11 (dvs. 1-10)
    jl .loop

    call _getch
    push 0
    call _exit
