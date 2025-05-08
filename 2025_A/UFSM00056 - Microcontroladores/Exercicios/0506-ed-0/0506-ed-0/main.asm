;
; 0506-ed-0.asm
;
; Created: 06/05/2025 13:47:50
; Author : watto
;
; Estudar um PWM com timer = 1
; Modo = ctc. Conta até icr1 ( tabela 15-5 = 12 )
; TCCR1A/B 
; simulide não funciona :)

.org 0x0016
INT_A:
	com r16
	out PORTB, r16
	reti

.org 0x0000
	sei						; liga interrupt
;---config---	
	ser r16					
	out DDRB, r16			; portD saida

	ldi r16, 0b00000000		; modo ctc = wgmc = 1100
	sts TCCR1A, r16

	ldi r16, 0b00011001
	sts TCCR1B, r16
;--/config---

	; carregar numero no ICR1 (hi:lo)
	; contar até 1000 (0x03E8)
	;                    ||||
	;                    hilo
	ldi r17, 0xf3			; hi de 1000
	sts ICR1H, r17
	ldi r17, 0xE8			; lo de 1000
	sts ICR1L, r17
	
	; pagina 49 interrupt vectors
	; [err] usar org 001A interrupcao do overflow do timer 1 >> ERRADO
	; é pra usar org 0016, interrupcao do comparador A

	;LDI r16, (1<< ICIE1)
	ldi r16, 0b00100000
	sts TIMSK1, r16
	clr r16

loop:
	rjmp loop
