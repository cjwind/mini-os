all: boot_sect.asm
	nasm -f bin boot_sect.asm -o boot_sect.bin

run: boot_sect.bin
	qemu-system-x86_64 boot_sect.bin

clean: boot_sect.bin
	rm boot_sect.bin