bits 16
org 0x7c00

start:
    ; Set up stack
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00

    ; Print "Hello, World!"
    mov si, hello_msg
print_loop:
    lodsb
    test al, al
    jz print_done
    mov ah, 0x0e
    int 0x10
    jmp print_loop
print_done:

    ; Load the kernel from the second sector
    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov dl, 0
    mov bx, 0x1000
    int 0x13

    ; Jump to the kernel
    jmp 0x1000:0000

hello_msg db 'Hello, World!', 0

times 510-($-$$) db 0
dw 0xaa55
