section .text
    global main    ; MUST BE DECLARED FOR LINKER (ld)
main:              ; ENTRY POINT
    mov edx,len    ; MESSAGE LENGTH
    mov ecx,msg    ; MESSAGE TO WRITE
    mov ebx,1      ; FILE DESCRIPTOR (stdout) 
    mov eax, 4     ; SYSTEM CALL NUMBER (sys_write)
    int 0x80       ; CALL KERNEL
    mov eax,1      ; SYSTEM CALL NUMBER (sys_exit)
    int 0x80       ; CALL KERNEL

section .data
msg db 'SUCCESS', 0xa   
len equ $ - msg     ; LENGTH OF STRING

; nasm -f elf main.asm  // COMPILE //
; ld -m elf_i386 -s -o main main.o  // LINK //