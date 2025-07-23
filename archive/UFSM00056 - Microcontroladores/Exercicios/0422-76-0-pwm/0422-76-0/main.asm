;
; 0422-76-0.asm
;
; Created: 4/22/2025 3:03:42 PM
; Author : watto
;

.org 0x001C	; TMR 0 Compare A interrupt
	clr r16
	out PORTB, r16				; portb[0] = 1
	reti						; retorna da intrpt

;.org 0x001E	; TMR 0 Compare B interrupt
.org 0x0020 ; TMR 0 Overflow interrupt
INT_OV:
inc r17
out OCR0A, r17 ;brilho
	ser r16
	out PORTB, r16				; portb[0] = 0
	reti						; retorna da interpt 


.org 0x0000
start:
	sei							; liga interrupcoes
	ser r16
	out DDRB, r16				; portB saída

	ldi r16, 0b00000000			; modo normal
			  ;||||||||
			  ;||||||00	- modo normal (WGM01 e WGM02 = 00 para normal)
			  ;||||--
			  ;||00		- irrelevante (não usar comp B)
			  ;00		- modo normal
	out TCCR0A, r16

	ldi r16, 0b00000001				; modo normal com pre scaler = 1
	out TCCR0B, r16

	ldi r16, 50
	out OCR0A, r16				; comp A = 127 (metade)

	ldi r16, 0b00000011			; liga interrp. Overflow e OCA
			  ;||||||||
			  ;|||||||1 - int.overflow = on
			  ;||||||1	- int. no comp a = on
			  ;|||||0	- int. no comp b = off
	sts TIMSK0, r16				; set mask

loop:
	rjmp loop
