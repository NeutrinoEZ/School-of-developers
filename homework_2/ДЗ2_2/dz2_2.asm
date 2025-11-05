global _start

section .data
    msg1 db "Enter 1 number: ", 0
    msg2 db "Enter 2 number: ", 0
    msg3 db "Answer: ", 0

section .text

lenstr:
    xor rax, rax
.loop:
    cmp byte [rdi + rax], 0
    je .end
    inc rax
    jmp .loop
.end:
    ret

strtoint:
    xor rax, rax
    xor rcx, rcx
.loop:
    mov cl, [rdi]
    cmp cl, 0
    je .end
    cmp cl, '0'
    jb .end
    cmp cl, '9'
    ja .end
    sub cl, '0'
    imul rax, 10
    add rax, rcx
    inc rdi
    jmp .loop
.end:
    ret

inttostr:
    mov rax, rsi
    mov r8, rdi
    mov rcx, 10
    xor r9, r9
    test rax, rax
    jnz .loop1
    mov byte [rdi], '0'
    mov byte [rdi+1], 0
    ret
.loop1:
    xor rdx, rdx
    div rcx
    push rdx
    inc r9
    test rax, rax
    jnz .loop1
.loop2:
    pop rax
    add al, '0'
    mov [rdi], al
    inc rdi
    dec r9
    jnz .loop2
    mov byte [rdi], 0
    ret

sum:
    mov rax, rdi
    add rax, rsi
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

_start:
    sub rsp, 512
    
    mov rdi, msg1
    call lenstr
    mov rsi, rax
    call print

    lea rdi, [rsp]
    mov rsi, 256
    call read

    lea rdi, [rsp]
    call strtoint
    push rax

    mov rdi, msg2
    call lenstr
    mov rsi, rax
    call print

    lea rdi, [rsp+256]
    mov rsi, 256
    call read

    lea rdi, [rsp+256]
    call strtoint
    mov rsi, rax

    pop rdi
    call sum

    lea rdi, [rsp]
    mov rsi, rax
    call inttostr

    mov rdi, msg3
    call lenstr
    mov rsi, rax
    call print

    lea rdi, [rsp]
    call lenstr
    mov rsi, rax
    call print

    push 10
    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 1
    syscall
    pop rax

    add rsp, 512

    mov rax, 60
    mov rdi, 0
    syscall
