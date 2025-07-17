section .data
    pass_count db 0
    fail_count db 3
    format_pass db "Pass count: %d", 10, 0
    format_fail db "Fail count: %d", 10, 0

section .text
    global _main
    extern _printf
    extern _getch
    extern _exit

; void inc_stat(byte* ptr)
inc_stat:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]     ; hent pointer (offset) til statistikvariabel
    inc byte [eax]       ; forøg værdien med 1

    pop ebp
    ret

_main:
    ; kald inc_stat med offset til pass_count
    push pass_count
    call inc_stat
    add esp, 4

    ; kald inc_stat med offset til fail_count
    push fail_count
    call inc_stat
    add esp, 4

    ; vis pass_count
    movzx eax, byte [pass_count]
    push eax
    push format_pass
    call _printf
    add esp, 8

    ; vis fail_count
    movzx eax, byte [fail_count]
    push eax
    push format_fail
    call _printf
    add esp, 8

    call _getch
    push 0
    call _exit
