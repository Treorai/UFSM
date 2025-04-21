;
; 0421-74-0-flag.asm
;
; Created: 4/21/2025 3:07:05 PM
; Author : watto
;

.org 0x0000
start:
	sei		; liga interrupcoes
	ldi r16, 0b01100000
			  ;||||||||
			  ;||||0000		fonte do mux
			  ;|||x
			  ;||1			adlar = resultado aliinhado pela esquerda
			  ;01			tensao de referencia
	
	sts ADMUX, r16		; salva na ram o reg

	ldi r16, 0b11101111
			  ;||||||||
			  ;|||||111		clock /128 para maior precisao
			  ;||01			interrupcoes IF-flag e IE-enable
			  ;|1			ADCSTART (para comecar coloca 1)
			  ;1			adc enable = liga o adc

	sts ADCSRA, r16

	ser r20
	out DDRD, r20		; portd saida
	out DDRB, r20		; portb saida
	cbi DDRC, 0			; portc[0] entrada

loop:
	rjmp loop

.org 0x002A			;endereco da interrupcao
ADC_int:
	ldi r16, 1				; teste de flag
	out PORTB, r16			; teste de flag
	push r16		; salva os registradores de uso geral
	push r17

	lds r16, ADCL	; le o valor do ADC
	lds r17, ADCH

	out PORTD, r17

	pop r17			; restaura os registradores de uso geral
	pop r16

	clr r16					; teste de flag
	out PORTB, r16			; teste de flag

	reti			; retorna da interrupcao
