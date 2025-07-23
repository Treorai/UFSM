;
; 0417-71-1.asm
;
; Created: 17/04/2025 13:48:03
; Author : watto
;
; Considere que um sensor de temperatura está ligado no AD4.
; Este sensor apresenta temperaturas entre 10 e 150 graus.
; Considere que o AD usa 10 bits.
; Faça um programa que fique lendo e mostrando a temperatura em 3 displays

start:
    ldi r16, 0b01100100
			  ;||||||||
			  ;||||0100	=> ler PORTC[4]
			  ;|||x		=> - (sempre zero)
			  ;||1		=> ADLAR = 8 bits valor na parte alta
			  ;01		=> tensao de ref = 01 = vcc

	sts ADMUX, r16

	ldi r16, 0b10000111
			  ;||||||||
			  ;|||||111 => clk (128)
			  ;|||00	=> sem interrupcao
			  ;||0		=> auto trigger off
			  ;|0		=> nao inicia
			  ;1		=> liga o adc
	sts ADCSRA, r16

	ser r16
	out DDRD, r16		; PORTD is output
	clr r16
	out DDRC, r16		; PORTC is input (onde estao os ad)

loop:
	lds r16, ADCSRA
	ori r16, 0b01000000	; liga o bit 6 e mantem os demais (start)
	sts ADCSRA, r16		; inicia a conversao

testa:
	lds r16, ADCSRA
	sbrc r16, 6			; se ADCSRA[6] == 0, pula prox linha
	rjmp testa

	lds r17, ADCL		; le parte baixa da conversao
	lds r16, ADCH		; le parte alta da conversao

; Conversão 10 bits para regra de 3
	; 0d00 = 0d010
	; 0xFF = 0d150




	out PORTD, r24		; escreve o valor lido em portD

	rjmp loop


	; AD = 10 bits
	; 0 = 10
	; 1024 = 150

