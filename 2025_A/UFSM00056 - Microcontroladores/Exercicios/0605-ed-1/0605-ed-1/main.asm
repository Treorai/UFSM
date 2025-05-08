;
; 0605-ed-1.asm
;
; Created: 06/05/2025 14:52:29
; Author : watto
;
; Mesmo anterior, mas usando fast

.org 0x0000
	sei						; liga interrupt
;---config---	
	ser r16					
	out DDRB, r16			; portD saida

	ldi r16, 0b10000011		; modo fast
	sts TCCR1A, r16

	ldi r16, (1 << WGM13 | (1 << WGM12) | (1 << << CS10)
	sts TCCR1B, r16
;--/config---

	; carregar numero no ICR1 (hi:lo)
	; contar até 1000 (0x03E8)
	;                    ||||
	;                    hilo
	ldi r17, 0xf3			; hi de 1000
	sts OCR1AH, r17
	ldi r17, 0xE8			; lo de 1000
	sts OCR1AL, r17

loop:
	rjmp loop
