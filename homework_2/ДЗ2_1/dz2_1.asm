section .data
    msg1 db "Enter your string: ", 0
    msg2 db "Reversed: ", 0

section .text
    global _start

lenstr:
    xor rax, rax
.loop:
    cmp byte [rdi + rax], 0
    je .end
    inc rax
    jmp .loop
.end:
    ret

rev:
    cmp rsi, 0
    je .end
    mov rcx, rsi
    dec rcx
    xor rax, rax
.loop:
    cmp rax, rcx
    jge .end
    mov dl, [rdi + rax]
    mov r8b, [rdi + rcx]
    mov [rdi + rax], r8b
    mov [rdi + rcx], dl
    inc rax
    dec rcx
    jmp .loop
.end:
    ret

print:
    mov rax, 1
    mov rdx, rsi
    mov rsi, rdi
    mov rdi, 1
    syscall
    ret

read:
    mov rax, 0
    mov rdx, rsi
    mov rsi, rdi
    mov rdi, 0
    syscall
    mov rdi, rsi
    add rdi, rax
    dec rdi
    mov byte [rdi], 0
    ret

nl:
    push 10
    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 1
    syscall
    pop rax
    ret

_start:
    sub rsp, 256

    mov rdi, msg1
    call lenstr
    mov rsi, rax
    call print

    mov rdi, rsp
    mov rsi, 256
    call read

    mov rdi, rsp
    call lenstr
    mov rsi, rax
    call rev

    mov rdi, msg2
    call lenstr
    mov rsi, rax
    call print

    mov rdi, rsp
    call lenstr
    mov rsi, rax
    call print

    call nl

    add rsp, 256

    mov rax, 60
    mov rdi, 0
    syscall
