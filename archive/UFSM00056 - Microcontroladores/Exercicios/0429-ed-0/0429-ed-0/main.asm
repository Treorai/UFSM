;
; 0429-ed-0.asm
;
; Created: 29/04/2025 14:17:50
; Author : watto
;
; Gere a forma de onda de 1hz para que um led pule com freq. de 1s

.org 0x0020
INT_OV:
	inc r18					; deve chegar a 151
	cpi r18, 37
	brne fim_int
	clr r18
	neg r17					; inverte r17
	out PORTD, r17

fim_int:
	reti

.org 0x0000
	sei						; liga inter
	ser r16					
	out DDRD, r16			; portD saida
	clr r18					; conta o # inter
	
							; modo ctc conta ate oca
	ldi r16, 0b00000010		; wgm00 = 10 para fast
	out TCCR0A, r16

	ldi r16, 0b00000101
	out TCCR0B, r16

	ldi r17, 206			; freq interr = 151 hz
	out OCR0A, r17

	ldi r16, 0b00000001		; liga int. no overflow
	sts TIMSK0, r16

loop:
	rjmp loop