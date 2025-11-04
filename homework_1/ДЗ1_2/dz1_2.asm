global _start

section .data
    message db "Hello world"
    length equ $ - message

    file db "dz1_2.txt",0

section .text
_start:

    mov rax, 2
    mov rdi, file
    mov rsi, 0x41
    mov rdx, 0644

    syscall

    mov r8, rax
    
    mov rax, 1
    mov rdi, r8
    mov rsi, message
    mov rdx, length
    syscall

    mov rax, 3
    mov rdi, r8
    syscall
   
    mov rax, 60
    mov rdi, 0
    syscall
 
