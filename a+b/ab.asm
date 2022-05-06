FORMAT ELF64 
public __start

msg db "fuck this shite",0xA,0
len = $-msg
a = 10
b = 100
sum = 2

section '.bss' writeable
    bss_char rb 1


section '.text' executable
__start:
    mov rax, '!'
    call print_char
    mov rax, '!'
    call print_char
    mov rax, '!'
    call print_char
    mov rax, '!'
    call print_char
    mov rax, '!'
    call print_char
    mov rax, sum
    mov rbx, b
    add rax, rbx
    add rax, a

    ; mov rbx, b
    ; add rax,rbx 
    ; mov rax, sum
    call print_number
    call exit

section '.print_number' executable
;input number
;rax
; 571 / 10 = 57 1
; 57 / 10 = 5 7
; 5 / 10 = 0 5
print_number:
    push rax; кладем на стек регистр rax
    push rbx; кладем на стек регистр rbx
    push rcx; кладем на стек регистр rcx
    push rdx; кладем на стек регистр rdx
    xor rcx, rcx; очищаем регистр rcx
    .next_iter: ; первый цикл
        cmp rax, 0; если регистр rax равен 0 печатать значени
        je .print_iter ; прыжок если равно print_iter
        mov rbx, 10 ; кладем в регистр rbx 10
        xor rdx, rdx ; очищаем регистр rdx
        div rbx ; делим на rbx
        add rdx, '0'; добавляем ноль к  регистр rdx
        push rdx; кладем на стек rdx
        inc rcx ; инкрементируем регистр rcx
        jmp .next_iter ; следующий цикл
    .print_iter:
        cmp rcx, 0
        je .close
        pop rax
        call print_char 
        dec rcx
        jmp .print_iter
    .close:
        pop rdx
        pop rcx
        pop rbx
        pop rax
        ret
    

section '.print_char' executable
print_char:
    push rax
    push rbx
    push rcx
    push rdx
    mov [bss_char], al

    mov rax, 4
    mov rbx, 1
    mov rcx, bss_char
    mov rdx, 1
    int 0x80
    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret
section '.exit' executable
exit:
    mov rax, 1
    mov rbx, 0
    int 0x80
