global adgangskode_check

extern access_denied, continue_game
extern _scanf, _printf, _strcmp


section .data
    prompt_msg      db "Indtast adgangskode: ", 0
    input_format    db "%s", 0
    correct_code    db "KEY1", 0
    msg_ok          db "Adgangskode korrekt!", 10, 0
    msg_wrong       db "Forkert kode.", 10, 0

section .bss
    input_buffer    resb 32    ; plads til brugerens input

section .text


adgangskode_check:
    push ebp
    mov ebp, esp

    ; Vis prompt
    push prompt_msg
    call _printf
    add esp, 4

    ; Læs input med scanf
    push input_buffer
    push input_format
    call _scanf
    add esp, 8

    ; Sammenlign med korrekt adgangskode
    push correct_code
    push input_buffer
    call _strcmp
    add esp, 8

    cmp eax, 0
    je .access_granted

    ; Forkert kode
    jmp access_denied

.access_granted:
    jmp continue_game

.done:
    pop ebp
    ret
