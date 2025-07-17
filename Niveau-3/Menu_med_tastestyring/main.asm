extern _printf
extern _getch
extern _fopen
extern _fclose
extern _fwrite
extern _fread





section .data
menu_text db 13, 10, "=== MENU ===", 13, 10
          db "1: CW-afspilning", 13, 10
          db "2: Statistik", 13, 10
          db "0: Afslut", 13, 10, "Valg: ", 0

invalid_choice db "Ugyldigt valg!", 13, 10, 0
exit_text db "Programmet afsluttes...", 13, 10, 0

cw db "cw", 0
stats db "stats", 0
section .bss
	choice resb 2

section .text

global main
main:

main_loop:
    ; Udskriv menu
    push menu_text
    call _printf
    add esp, 4

    ; Læs ét tegn fra bruger
    call _getch
    mov [choice], al

    ; Tjek valg
    cmp byte [choice], '1'
    je do_cw

    cmp byte [choice], '2'
    je do_stats

    cmp byte [choice], '0'
    je do_exit

    ; Ellers ugyldigt valg
    push invalid_choice
    call _printf
    add esp, 4
    jmp main_loop

do_cw:
    push cw
	call _printf
	add esp,4
	call _getch
    jmp main_loop

do_stats:
    push stats
	call _printf
	add esp, 4
	call _getch
    jmp main_loop

do_exit:
    push exit_text
    call _printf
    add esp, 4
    ret
