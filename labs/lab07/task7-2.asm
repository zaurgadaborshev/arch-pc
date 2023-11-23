%include 'in_out.asm'
SECTION .data
    msgA:	DB 'Input A: ',0
    msgX:       DB 'Input X: ',0

SECTION .bss
    A:	RESB 80
    X:  RESB 80
    result:     RESB 80

SECTION .text
    GLOBAL _start

_start:
    mov eax,msgA
    call sprint
    mov ecx,A
    mov edx,80
    call sread
    mov eax,A
    call atoi 
    mov [A],eax

    mov eax,msgX
    call sprint
    mov ecx,X
    mov edx,80
    call sread 
    mov eax,X
    call atoi
    mov [X],eax   

    mov edx, [A]
    mov ebx, [X]
    cmp ebx, edx
    jb first
    jmp second

first:
    mov eax,[A]
    mov ebx, 3
    mul ebx
    add eax, 1
    call iprintLF 
    call quit
second:
    mov eax,[X]
    mov ebx, 3
    mul ebx
    add eax, 1
    call iprintLF 
    call quit
