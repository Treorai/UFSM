;
; 0410-qn-1.asm
;
; Created: 10/04/2025 13:38:51
; Author : watto
;
; Mostre em 2 botões o valor de um contador
; O circuito deve ter 2 botões.
; 1 incrementa e 1 decrementa o contador a cada click
; de 0 a 22

start:
	clr r16
	out DDRC, r16		; portC entrada
	out DDRB, r16		; portB entrada

	ser r16
	out DDRD, r16		; portD saida
	out PORTB, r16		; portB liga pull up

loop:
	in r17, PINB
	in r16, PINC
	; pinc[0] - dec
	; pinc[1] - inc

	sbrc r16, 0			; if bit 0 = 0 skip line:
	jmp bit0istrue
	sbrc r16, 1			; if bit 1 = 0 skip line:
	jmp bit1istrue
	jmp loop

bit0istrue:
; if pinc bit 0 = 1:
	dec r17
	out PORTD, r17
	jmp loop
bit1istrue:
; if pinc bit 1 = 1:
	inc r17
	out PORTD, r17
	jmp loop