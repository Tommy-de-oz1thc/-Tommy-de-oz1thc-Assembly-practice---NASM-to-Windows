section .data
    format db "Resultat: %d", 10, 0

section .text
    global _main
    extern _printf
    extern _getch
    extern _exit

; Funktion: int add(int a, int b)
; Returnerer a + b i EAX
add:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]    ; første parameter (a)
    add eax, [ebp+12]   ; anden parameter (b)

    pop ebp
    ret

_main:
    ; kald add(5, 7)
    push 7
    push 5
    call add
    add esp, 8          ; ryd stacken

    ; vis resultatet
    push eax
    push format
    call _printf
    add esp, 8

    call _getch
    push 0
    call _exit
