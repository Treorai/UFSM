;
; 0327-38-2.asm
;
; Created: 27/03/2025 14:57:14
; Author : watto
;
; Faça B = A-100. A está em port D e B na port B.

.dseg
	A: .byte 1
	B: .byte 2
.cseg

start:
	clr r16			; r16 <- 0
	out DDRD, r16	; portD is input

	ldi r16, 0xFF	; r16 <- 255 (1111 1111)
	out PORTD, r16	; liga pullup em portd
	out DDRB, r16	; ddrb <- r16 | portB is output

loop:
	in r16, PIND	; ler portD (x) salvar em r16
	sts A, r16		; A <- x

	subi r16, 100

	sts B, r16		; salva pra ram
	out PORTB, r16	; saida portB <- r17 | PRINT

	rjmp loop