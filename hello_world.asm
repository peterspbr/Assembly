;	hello_world.asm
;	Author: Peter
;	Date: Jan 20 2020

global _start

_start:
	mov eax, 0x4		; Mov write syscall to accumulator
	mov ebx, 1		; Return
	mov ecx, message	; Get the message then write it into the counter register
	mov edx, message_length	; get the message length then write it into the data register
	int 0x80		; Interrupt with code 0x80
	
	; Friendly exit then return 0
	mov eax, 0x1
	mov ebx, 0
	int 0x80

section .data:
	message: db "Hello world!", 0x0a	; 0x0a means a new line. It's the hex code for \n
	message_length equ $-message		; Check the message length. Is the same of strlen()
