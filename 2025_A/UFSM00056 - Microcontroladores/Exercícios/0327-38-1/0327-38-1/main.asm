;
; 0327-38-1.asm
;
; Created: 27/03/2025 14:11:41
; Author : watto
;
; Faça y = x2 + 2*x. O valor de x está na port D. Mostre y na Port B.
; x=a  y=b

.dseg
	A: .byte 1
	B: .byte 2
.cseg

start:
	;configurar portas de entrada e saida
	;a= in portd	b= out portb
	;b= a^2+2a


	clr r16			; r16 <- 0
	out DDRD, r16	; portD is input

	ldi r16, 0xFF	; r16 <- 255 (1111 1111)
	out PORTD, r16	; liga pullup em portd
	out DDRB, r16	; ddrb <- r16 | portB is output

loop:
	in r16, PIND	; ler portD (x) salvar em r16
	sts A, r16		; A <- x
	mov r17, r16	; r17 <- x 
	add r17, r16	; r17 <- 2x

	mul r16, r16	; r1:r0 <- r16 * r16 ou A^2
	add r17, r0		; r17 <- r17 + r0 | r17 <- 2a+a^2

	sts B, r17		; salva pra ram
	out PORTB, r17	; saida portB <- r17 | PRINT

	rjmp loop