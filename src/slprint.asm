section .text
    global slprint

slprint:
    push rdi
    mov rax, rdi
    call str_len
    pop rsi
    mov rdx, rax
    mov rax, 1
    mov rdi, 1
    syscall
    ret

str_len:
    push rdi
    xor rax, rax
.loop:
    cmp byte [rdi + rax], 0
    je .done
    inc rax
    jmp .loop
.done:
    pop rdi
    ret
