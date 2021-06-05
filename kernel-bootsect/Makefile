all: boot_sect.asm kernel.c
	nasm -f bin boot_sect.asm -o boot_sect.bin
	gcc -ffreestanding -c kernel.c -o kernel.o
	ld -o kernel.bin -Ttext 0x1000 kernel.o --oformat binary
	cat boot_sect.bin kernel.bin > os-image.bin

run: os-image.bin
	qemu-system-i386 -fda os-image.bin

clean:
	rm *.bin *.o