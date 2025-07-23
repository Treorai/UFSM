;
; 0401-46-2.asm
;
; Created: 01/04/2025 15:03:03
; Author : watto
;
; Leia um valor de 4 bits 'A' em portB[3..0] e outro 'B' em [PORTB[7..4].
;	Coloque um botao em PORTC[0] e um led em PORTC[1].
;	Se o botao estiver pressionado, mostre em PORTD A+B, caso contrario A-B.


start:
	clr r16				; r16 <- 00
	out DDRB, r16		; portB entrada
	out portB, r16		; pull up

	ldi r16, 0x2		; r16 <- 02
	out DDRC, r16		; portC[0] entrada, portC[1] saida
	out portC, r16		; pull up

	ser r16				; r16 <- FF
	out DDRD, r16		; portD saida
	
	in r17, PINB		; r17 < -pinB[lo]
	in r18, PINB		; r18 <- pinB[hi]

	andi r17, 0b00001111	; clear hi r17
	lsr r18
	lsr r18
	lsr r18
	lsr r18

loop:
	sbic PINC,0
	jmp soma

diff:
	sub r17, r18
	jmp print

soma:
	add r17, r18

print:
	out PORTD, r17