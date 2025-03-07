# x_os
A hobby operating system written in mainly x86 assembly

## Build

Assemble the bootloader

```
nasm -f bin -o bootloader.bin bootloader.asm
```

Create a bootable floppy image (optional)

```
dd if=bootloader.bin of=floppy.img bs=512 count=1
```