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

Assemble the kernel

```
nasm -f bin -o kernel.bin kernel.asm
```

Combine the bootloader and kernel into a bootable image

```
cat bootloader.bin kernel.bin > os-image.bin
```

Create a bootable floppy image (optional)

```
dd if=os-image.bin of=floppy.img bs=512 count=2880
```

Test using an emulator like QEMU

```
qemu-system-x86_64 -fda os-image.bin
```