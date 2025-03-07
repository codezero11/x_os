bits 32
section .text
global start

start:
    ; Set up segments
    cli
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    mov esp, 0x90000 ; Set up stack

    ; Clear the screen
    mov edi, 0xb8000
    mov ecx, 80*25
    mov eax, 0x0720
    rep stosw

    ; Print "Welcome to X OS!"
    mov esi, welcome_msg
print_loop:
    lodsb
    test al, al
    jz print_done
    mov ah, 0x0E
    mov bx, 0x0007
    int 0x10
    jmp print_loop
print_done:

    hlt

welcome_msg db 'Welcome to X OS!', 0
