;
; Exercicio01_25032025.asm
;
; Created: 25/03/2025 14:08:36
; Author : watto
;
; Fa�a um programa que configure a PORTB como entrada e leia o valor de PORTB. Fa�a esse valor + 15 e mostre em PORTD.

start:
	clr r16				; zera o registrador (ou) ldi r16, 0

	; DDRB = 0000 0000 -> Dizer que PORTB � input
	; ST: "STORE INDIRECT"

	sts DDRB, r16		; DDRB <- 0000 0000
	
	; PORTD � output DDRD = 1111 1111
	ser r16				; r16 <- 1111 1111
	sts DDRD, r16


loop:
	; ler a porta B
	lds r16, PINB		; PINB s�o os pinos de entrada de PORTB
	ldi r17, 15			; r17 <- '15'

	; soma 15 em PORTB
	add r16, r17		; r16 <- r16 + r17

	; escrever o resultado em PORTD
	sts PORTD, r16		; PORTD recebe a soma
	rjmp loop			; volta

; Replace with your application code
start:
    inc r16
    rjmp start
