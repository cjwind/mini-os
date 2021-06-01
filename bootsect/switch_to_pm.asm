[bits 16]

switch_to_pm:
    cli                     ; clear interrupt flag
    lgdt [gdt_descriptor]   ; load gdt

    mov eax, cr0            ; set cr0 for 32-bit protected mode
    or eax, 0x1
    mov cr0, eax

    jmp CODE_SEG:init_pm    ; far jump to flush pipeline

[bits 32]
init_pm:
    ; initialize segment registers in 32 bit protected mode
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    ; setup stack position
    mov ebp, 0x90000
    mov esp, ebp

    call BEGIN_PM