
extern _printf, _getch

section .data
show_text_flag db 0                  ; 1 = vises, 0 = skjult
msg_text_vises db "Tekst vises", 10, 0
msg_text_skjult db "Tekst skjult", 10, 0

section .text
main:

toggle_vis_flag:
    ; Skift værdi: XOR mellem 0 og 1
    mov al, [show_text_flag]
    xor al, 1
    mov [show_text_flag], al

    ; Vis besked baseret på ny værdi
    cmp al, 1
    je .vises

.skjult:
    push msg_text_skjult
    call _printf
    add esp, 4
	call _getch
    ret

.vises:
    push msg_text_vises
    call _printf
    add esp, 4
	call _getch
    ret
