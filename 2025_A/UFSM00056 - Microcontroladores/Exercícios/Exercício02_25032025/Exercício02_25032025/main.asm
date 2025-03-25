;
; Exercício02_25032025.asm
;
; Created: 25/03/2025 14:41:59
; Author : watto
;
; Faça um programa que configure a PORTB como entrada, e leia o valor de PORTB. Faça esse valor x 5 e mostre em PORTD.


start:
    clr r16 ; zera o reg

	out DDRB, r16 ; DDRB <- 0000 0000

	; PORTD é output DDRD = 1111 1111
	ser r16			; r16 <- 1111 1111
	out DDRD, r16	; 
	out PORTB, r16	; PORTB <- 1111 1111 ligando pull up

loop:
	in r16, PINB	; PINB sãos os pinos de entrada de PORTB
	ldi r17, 5		; r17 <- 5

	mul r16, r17	; r1:r0 <- r16 * r17

	out PORTD, r0	; PORTD são os pinos pra saida | r0 é a saída padrão das multiplicações
	jmp loop
