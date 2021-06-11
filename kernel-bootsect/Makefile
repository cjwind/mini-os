CC=i686-linux-gnu-gcc
LD=i686-linux-gnu-ld
NASM=nasm
QEMU=qemu-system-i386

all: os-image.bin

run: all
	${QEMU} -fda os-image.bin

# $^ means all of the target's dependency files
os-image.bin: boot_sect.bin kernel.bin
	cat $^ > os-image.bin

kernel.bin: kernel_entry.o kernel.o
	${LD} -o kernel.bin -Ttext 0x1000 $^ --oformat binary

# $< is the first dependency and $@ is the target file
kernel.o: kernel.c
	${CC} -ffreestanding -fno-pie -c $< -o $@

kernel_entry.o: kernel_entry.asm
	${NASM} $< -f elf -o $@

boot_sect.bin: boot_sect.asm
	${NASM} -f bin $< -o $@

clean:
	rm *.bin *.o