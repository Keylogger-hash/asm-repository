format ELF64 executable 3
entry start

segment readable writeable
msg db "Hello world! This is my first programm in assembler! It's good", 0
a = 1
b = 2
len = $-msg

segment readable writeable executable
start:
    mov eax, 4; write
    mov ebx, 1; stdout
    mov ecx, msg; pointer
    mov edx, len; mov on then len number symbols
        
    int 0x80

    call exit

segment executable readable writeable
exit:
    mov eax, 1; return success
    mov ebx, 0; return failed
    int 0x80