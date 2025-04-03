;
; 0403-46-3.asm
;
; Created: 03/04/2025 13:48:42
; Author : watto
;
; Leia um valor entre 0 e 15 em PORTB. Escreva este valor em HEXA, em um display de 7 segmentos na PORTD.

start:
	clr r16
	out DDRB, r16		; portB entrada
	
	ser r16
	out DDRD, r16		; portD saida
	out PORTB, r16		; portB liga pull up

loop:
	out PORTD, r18
	in r16, PINB
	andi r16, 0b00001111

	ldi r17, 0x00
	cpse r16, r17		; skip if pinB == 0
	jmp n1
	jmp iszero
n1:
	ldi r17, 0x01
	cpse r16, r17
	jmp n2
	jmp isone
n2:
	ldi r17, 0x02
	cpse r16, r17
	jmp n3
	jmp istwo
n3:
	ldi r17, 0x03
	cpse r16, r17
	jmp n4
	jmp isthree
n4:
	ldi r17, 0x04
	cpse r16, r17
	jmp n5
	jmp isfour
n5:
	ldi r17, 0x05
	cpse r16, r17
	jmp n6
	jmp isfive
n6:
	ldi r17, 0x06
	cpse r16, r17
	jmp n7
	jmp issix
n7:
	ldi r17, 0x07
	cpse r16, r17
	jmp n8
	jmp isseven
n8:
	ldi r17, 0x08
	cpse r16, r17
	jmp n9
	jmp iseight
n9:
	ldi r17, 0x09
	cpse r16, r17
	jmp nA
	jmp isnine
nA:
	ldi r17, 0x0A
	cpse r16, r17
	jmp nB
	jmp isA
nB:
	ldi r17, 0x0B
	cpse r16, r17
	jmp nC
	jmp isB
nC:
	ldi r17, 0x0C
	cpse r16, r17
	jmp nD
	jmp isC
nD:
	ldi r17, 0x0D
	cpse r16, r17
	jmp nE
	jmp isD
nE:
	ldi r17, 0x0E
	cpse r16, r17
	jmp nF
	jmp isE
nF:
	ldi r17, 0x0F
	cpse r16, r17
	jmp loop
	jmp isF

iszero:
	ldi r18, 0b00111111
	out PORTD, r18
	jmp loop
isone:
	ldi r18, 0b00000110
	out PORTD, r18
	jmp loop
istwo:
	ldi r18, 0b01011011
	out PORTD, r18
	jmp loop
isthree:
	ldi r18, 0b01001111
	out PORTD, r18
	jmp loop
isfour:
	ldi r18, 0b01100110
	out PORTD, r18
	jmp loop
isfive:
	ldi r18, 0b01101101
	out PORTD, r18
	jmp loop
issix:
	ldi r18, 0b01111101
	out PORTD, r18
	jmp loop
isseven:
	ldi r18, 0b00000111
	out PORTD, r18
	jmp loop
iseight:
	ldi r18, 0b01111111
	out PORTD, r18
	jmp loop
isnine:
	ldi r18, 0b01101111
	out PORTD, r18
	jmp loop
isA:
	ldi r18, 0b01110111
	out PORTD, r18
	jmp loop
isB:
	ldi r18, 0b01111100
	out PORTD, r18
	jmp loop
isC:
	ldi r18, 0b01011000
	out PORTD, r18
	jmp loop
isD:
	ldi r18, 0b01011110
	out PORTD, r18
	jmp loop
isE:
	ldi r18, 0b01111001
	out PORTD, r18
	jmp loop
isF:
	ldi r18, 0b01110001
	out PORTD, r18
	jmp loop
