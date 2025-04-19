;
; Trabalho02.asm
;
; Created: 4/19/2025 2:47:12 PM
; Author : Wagner Spinato Chitto
; Matricula: 201421493
;
; OBJETIVO
; Ler 3 valores de temperatura ligados nos conversores ADC0, ADC1 e ADC2
; Os valores lidos vao de 4 (lido como 0 no adc) ate 139 (lido como 1023 no ADC)
; Mostrar a media dos valores lidos como um número em 3 displays de 7 segmentos.
;

start:
	ldi r16, 0b01100000			; r16 <- leitura do ADC0 em PC0
	ldi r17, 0b01100010			; r17 <- leitura do ADC1 em PC2
	ldi r18, 0b01100100			; r18 <- leitura do ADC2 em PC4

	ldi r19, 0b10000111			; setup do conversor
	sts ADCSRA, r19

	ser r19
	out DDRD, r19				; PORTD is output
	out DDRB, r19				; PORTB is output
	clr r19
	out DDRC, r19				; PORTC is input

loop:
	clr r19
muxadc0:
	cpi r19, 0x00				; r19 = registrador do incremento do mux
	brne muxadc1				
	sts ADMUX, r16				; use adc0
	jmp muxisset
muxadc1:
	cpi r19, 0x01
	brne muxadc2
	sts ADMUX, r17				; use adc1
	jmp muxisset
muxadc2:
	sts ADMUX, r18				; use adc2
	cpi r19, 0x02
	breq muxisset
	jmp loop

muxisset:
	; mudanca do mux
	inc r19

	;jmp muxadc0 FIM

	lds r20, ADCSRA
	ori r20, 0b01000000	; liga o bit 6 e mantem os demais
	sts ADCSRA, r20		; inicia a conversao

testa:
	lds r20, ADCSRA
	sbrc r20, 6			; se ADCSRA[6] == 0, espera terminar a conversao
	rjmp testa

	lds r21, ADCL		; le parte baixa da conversao
	lds r20, ADCH		; le parte alta da conversao
	out PORTD, r20		; escreve o valor lido em portD

	rjmp muxadc0
