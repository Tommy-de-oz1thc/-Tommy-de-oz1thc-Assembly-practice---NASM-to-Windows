BITS 32
global _main
extern _printf, _fopen, _fprintf, _fclose, _exit, _getch, _fscanf

section .data
filename db "cw_stats.dat", 0
save_mode     db "w", 0
fmt_string db "%d %d", 0
have_key_attic     dd 12
have_key_creative  dd 23
save_ok_msg   db "✅ Skrevet til fil", 10, 0
save_fail_msg db "❌ FEJL: fopen returnerede NULL", 10, 0
mode_read db "r", 0

section .text

_main:

.Load:
    ; Open in readmode
    push mode_read
    push filename
    call _fopen
    add esp, 8
    test eax, eax
    jz .done          ; One if the file exist
    mov ebx, eax      ; File handeling

    ; fscanf(fp, "%d %d %d", &current_room, &have_map, &have_key)
    push have_key_creative
    push have_key_attic
    
    push fmt_string
    push ebx
    call _fscanf
    add esp, 20

    ; Luk filen
    push ebx
    call _fclose
    add esp, 4

; Øg værdierne
    mov eax, [have_key_attic]
    add eax, 1
    mov [have_key_attic], eax

    mov eax, [have_key_creative]
    add eax, 2
    mov [have_key_creative], eax

    


.Write:
    ; Åbn fil til skrivning
    push save_mode
    push filename
    call _fopen
    add esp, 8
    test eax, eax
    jz .write_failed   ; Hvis fopen returnerede NULL

    mov ebx, eax       ; Gem FILE* i ebx

    ; Gem data til filen
    push dword [have_key_creative]
    push dword [have_key_attic]
    push fmt_string
    push ebx
    call _fprintf
    add esp, 16

    ; Luk fil
    push ebx
    call _fclose
    add esp, 4

    ; Udskriv success
    push save_ok_msg
    call _printf
    add esp, 4
    jmp .done

.write_failed:
    push save_fail_msg
    call _printf
    add esp, 4

.done:
    call _getch
    push 0
    call _exit
