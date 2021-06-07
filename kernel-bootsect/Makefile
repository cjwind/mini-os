CC=i686-linux-gnu-gcc
LD=i686-linux-gnu-ld
NASM=nasm
QEMU=qemu-system-i386

all: boot_sect.asm kernel.c kernel_entry.asm
	${NASM} -f bin boot_sect.asm -o boot_sect.bin
	${CC} -ffreestanding -fno-pie -c kernel.c -o kernel.o
	${NASM} kernel_entry.asm -f elf -o kernel_entry.o
	${LD} -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary
	cat boot_sect.bin kernel.bin > os-image.bin

run: os-image.bin
	${QEMU} -fda os-image.bin

clean:
	rm *.bin *.o