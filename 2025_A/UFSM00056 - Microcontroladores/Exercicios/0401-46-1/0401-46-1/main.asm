;
; 0401-46-1.asm
;
; Created: 01/04/2025 14:28:58
; Author : watto
;
; Coloque uma chave na porta B0 e um led na porta B1. se o botao estiver pressionado, ligue o led. caso contrario apague

start:
	;ldi r16, 0x2		; r16 <- 'xxx x10'
	ldi r16, 0b00000010
	out DDRB, r16		; portB[0] entrada, portB[1]
	out portB, r16		; pull up

loop:
	sbic PINB,0			; se portb0 = 0 pula uma linha
	jmp liga
	cbi PORTB,1			; b1 <- 0
	jmp loop
liga:
	sbi portb,1			; b1 <- 1
	jmp loop
