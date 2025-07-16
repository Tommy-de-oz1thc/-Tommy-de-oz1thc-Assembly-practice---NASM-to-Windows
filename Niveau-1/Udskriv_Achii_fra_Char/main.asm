section .data
    format db "ASCII-værdi: %d", 10, 0

section .text
    global _main
    extern _getch
    extern _printf
    extern _exit

; Funktion: int print_ascii()
; Venter på tast, returnerer ASCII-værdi i EAX
print_ascii:
    call _getch         ; få ét tegn
    movzx eax, al       ; udvid AL til EAX (returværdi)
    ret

_main:
    call print_ascii    ; få ascii-værdi i eax

    ; udskriv ascii-værdi
    push eax
    push format
    call _printf
    add esp, 8

    call _getch         ; vent før exit
    push 0
    call _exit

