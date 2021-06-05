; prints the value of DX as hex.
print_hex:
    pusha

    mov ax, 5
loop:                           ; for (ax = 5; ax >= 2; ax--)
    cmp ax, 2
    jl end_loop
        mov cx, 0
        shr dx, 1               ; dx >> 1
        jnc end_if_1
            add cx, 1           ; if cf == 1, cx += 1
    end_if_1:
        
        shr dx, 1               ; dx >> 1
        jnc end_if_2 
            add cx, 2           ; if cf == 1, cx += 2
    end_if_2:

        shr dx, 1               ; dx >> 1
        jnc end_if_3         
            add cx, 4           ; if cf == 1, cx += 4
    end_if_3:

        shr dx, 1               ; dx >> 1
        jnc end_if_4
            add cx, 8           ; if cf == 1, cx += 8
    end_if_4:

		; only bx can be used as an index register
        mov bx, HEX_OUT
        add bx, ax              ; bx = HEX_OUT + ax

        cmp cx, 10
        jl less_ten
            mov byte [bx], 'a'  ; [bx] = 'a'
            sub cx, 10          ; cx -= 10
    less_ten:
        add [bx], cx            ; [bx] += cx

    sub ax, 1                   ; ax--
    jmp loop
end_loop:

    mov bx, HEX_OUT
    call print_string

    popa
    ret

;%include "print_string.asm"