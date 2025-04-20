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
	;ldi r16, 0b01000000		; leitura do ADC0 em PC0
	;ldi r16, 0b01000010		; leitura do ADC1 em PC2
	;ldi r16, 0b01000100		; leitura do ADC2 em PC4

	ldi r17, 0b10000111			; setup do conversor
	sts ADCSRA, r17

	ser r17
	out DDRD, r17				; PORTD is output
	out DDRB, r17				; PORTB is output
	clr r17
	out DDRC, r17				; PORTC is input
	
loop:
	clr r17
	clr r26
muxadc0:
	cpi r17, 0x00				; r17 = registrador do incremento do mux
	brne muxadc1
	ldi r16, 0b01000000
	sts ADMUX, r16				; use adc0
	jmp muxisset
muxadc1:
	cpi r17, 0x01
	brne muxadc2
	ldi r16, 0b01000010
	sts ADMUX, r16				; use adc1
	jmp muxisset
muxadc2:
	ldi r16, 0b01000100
	sts ADMUX, r16				; use adc2
	cpi r17, 0x02
	breq muxisset
	jmp loop

;	cpi r17, 0x02
;	brne loop
;	ldi r16, 0b01000100
;	sts ADMUX, r16
;	jmp muxisset


muxisset:
	; mudanca do mux
	lds r18, ADCSRA
	ori r18, 0b01000000	; liga o bit 6 e mantem os demais
	sts ADCSRA, r18		; inicia a conversao

testa:
	lds r18, ADCSRA
	sbrc r18, 6			; se ADCSRA[6] == 0, espera terminar a conversao
	rjmp testa

	lds r19, ADCH		; le parte alta da conversao
	lds r18, ADCL		; le parte baixa da conversao

	; salva a word
trio:
	cpi r17, 0x00
	breq salva0
	cpi r17, 0x01
	breq salva1
	cpi r17, 0x02
	breq salva2

salva0:
	movw r20, r18
	;save[21:20]
	inc r26
	inc r17
	sbrs r26, 2					; skip se r16 = 4
	jmp muxadc0
	jmp soma
salva1:
	movw r22, r18
	;save[23:22]
	inc r26
	inc r17
	sbrs r26, 2					; skip se r16 = 4
	jmp muxadc0
	jmp soma
salva2:
	movw r24, r18
	;save[25:24]
	inc r26
	inc r17
;	sbrs r26, 2					; skip se r16 = 4
;	jmp muxadc0
;	jmp soma

soma:
	ldi r26, 0x01				; limpa r26
	clr r28
	clr r29

	adc r28, r20
	adc r29, r21

	adc r28, r22
	adc r29, r23

	adc r28, r24
	adc r29, r25

	; [r29:r28] total da soma
	; Temperatura vai de 4 ate 139 (na soma, 12 ate 417)
	out portd, r29
	out portb, r28
	rjmp loop
	
	ldi r22, 0x03		; divisor 3
	clr r24
	clr r25				; resultado em [25:24]

divalto:
	cp r29, r22
	brlt divbaixo		; nao consegue mais dividir
	sub r29, r22
	inc r25
	rjmp divalto

divbaixo:
	cp r28, r22
	brlt fimdiv
	sub r28, r22
	inc r24
	rjmp divbaixo

fimdiv:

	out PORTB, r25		; escreve o valor alto em portB
	out PORTD, r24		; escreve o valor baixo em portD

	rjmp loop
	;rjmp muxadc0
