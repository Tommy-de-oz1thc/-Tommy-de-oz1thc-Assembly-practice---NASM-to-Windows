section .data
    alphabet db 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    len_alphabet equ 26
    fmt_char db "%c ", 0
    newline db 10, 0

section .bss
    seed resd 1

section .text
    global _main
    extern _printf, _exit, _getch
    extern __imp__Sleep

_main:
    extern _time
    push 0
	call _time
	add esp, 4
	mov [seed], eax
    mov esi, 0          ; <- Tæller sat til 0
.loop:
    cmp esi, 10
    jge .done

    ; Random-sekvens
    mov eax, [seed]
    imul eax, 1664525
    add eax, 1013904223
    mov [seed], eax

    xor edx, edx
    mov ebx, len_alphabet
    div ebx
    movzx eax, byte [alphabet + edx]
    movzx eax, al
    push eax
    push fmt_char
    call _printf
    add esp, 8

    ; Sleep
    push 300
    call [__imp__Sleep]

    inc esi
    jmp .loop


.done:
    ; Udskriv newline
    push newline
    call _printf
    add esp, 4
    call _getch
    ; Afslut
    push 0
    call _exit
