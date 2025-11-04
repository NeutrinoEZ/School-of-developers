global _start

section .data
    message db "Hello world!",10
    length equ $ - message

section .text

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, length
    syscall

    cmp rax, length
    jne error

    mov rax, 60
    mov rdi, 0
    syscall

error:
    mov rax, 60
    mov rdi, 1
    syscall
