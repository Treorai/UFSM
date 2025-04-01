;
; Exercicio03_25032025.asm
;
; Created: 25/03/2025 14:57:17
; Author : watto
;
; Faça um programa que leia 2 valores de PORTB e PORTC e mostre a soma em PORTD.

start:
    clr r16			; r16 <- 0000 0000 | limpa o reg r16
	clr r17			; r17 <- 0000 0000 | limpa o reg r17

	out DDRB, r16	; DDRB <- 0000 0000 | dizer que PORTB eh input
	out DDRC, r16	; DDRC <- 0000 0000 | dizer que PORTC eh input

	ser r16			; r16 <- 1111 1111 | "SET REGISTER"
	out DDRD, r16	; r16 <- 1111 1111 | dizer que PORTD eh output
	out PORTB, r16	; PORTB <- 1111 1111 | ligando pull up
	out PORTC, r16  ; PORTB <- 1111 1111 | ligando pull up

loop:
	in r16, PINB	; PINB sao os pinos de entrada de PORTB | le a porta B
	in r17, PINC	; PINC sao os pinos de entrada de PORTC | le a porta C
	
	add r16, r17	; r16 <- r16, r17

	out PORTD, r16	; PORTD sao os pinos pra saida
	jmp loop