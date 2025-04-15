;
; 0415-67-1.asm
;
; Created: 15/04/2025 14:37:04
; Author : watto
;


start:
    ldi r16, 0b01100000
			  ;||||||||
			  ;||||0000	=> ler AD0
			  ;|||x
			  ;||1		=> ADLAR = 8 bits valor na parte alta
			  ;01		=> tensao de ref = 01 = vcc
	sts ADMUX, r16;

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
	ori r16, 0b01000000	; liga o bit 6 e mantem os demais
	sts ADCSRA, r16		; inicia a conversao

testa:
	lds r16, ADCSRA
	sbrc r16, 6			; se ADCSRA[6] == 0, pula prox linha
	rjmp testa

	lds r17, ADCL		; le parte baixa da conversao
	lds r16, ADCH		; le parte alta da conversao
	out PORTD, r16		; escreve o valor lido em portD

	rjmp loop
