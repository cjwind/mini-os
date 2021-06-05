print_string:           ; function name
    pusha               ; push all register to stack to preserve them

    mov ah, 0x0e        ; tty mode

loop_start:
    cmp byte [bx], 0    ; compare [bx] which is one byte to zero, for null terminating char
    je loop_end         ; if [bx] == 0, end loop
    mov al, [bx]        ; move char printed to al
    int 0x10            ; call print interrupt
    add bx, 1           ; bx + 1, move to next char
    jmp loop_start      ; run loop body again

loop_end:    
    popa                ; restore all register
    ret                 ; return to callee