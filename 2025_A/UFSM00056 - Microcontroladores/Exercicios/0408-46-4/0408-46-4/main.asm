;
; 0408-46-4.asm
;
; Created: 08/04/2025 13:49:37
; Author : watto
;
; Considere a Var ‘A’, lida em PORTB. Este valor deve ser limitado entre 0 e 15, pelo programa.
;   Escreva este valor em 2 displays de 7 segmentos.
;   Os 2 displays estão ligados em PORTD e em PORTC se faz o controle sobre qual display deve ser ligado.

start:
	clr r16
	out DDRB, r16		; portB entrada

	ldi r16, 0b0000011	; portC in/out
	out DDRC, r16		; portC switch
	
	ser r16
	out DDRD, r16		; portD saida
	out PORTB, r16		; portB liga pull up
	out PORTC, r16		; portC liga pull up

loop:
	in r16, PINB
	in r17, PINB
	andi r16, 0b00001111	; limita a 15
	andi r17, 0b00001111
	lsl r16					; shift
	lsl r16
	lsl r16
	lsl r16
	or r16, r17				; output duplo no r16

	in r18, PINC
	sbrc r18, 2				; skip if switch = 0
	;run if switch = 0
	jmp enable1
enable2:
	;set enables
	ldi r19, 0x01
	jmp print

enable1:
	ldi r19, 0x02
	jmp print

print:
	out PORTC, r19		; enables
	out PORTD, r16		; porta d
	jmp loop