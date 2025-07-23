;
; 0401-38-4.asm
;
; Created: 01/04/2025 13:44:56
; Author : watto
;
; Faca um led piscar, deixando um longo período entre cada piscada (sem usar timer). O led ligado em portB[0]

;start:
;	ser r16			; r16 <- FF
;	out DDRB, r16	; PORTB eh saida
;	
;loop:
;	dec r16			; Decrement r16 (r16 -1)
;	brne loop		; se não chegou em 0, (breq = se chegou em zero) , volta pro loop 
;
;	; quando chegar em 0, segue:
;	in r17, PINB	; le a porta B
;	neg r17			; inverte o r17 (complemento de 1)
;	out PORTB, r17	; escreve a porta B
;	rjmp start


start:
	ser r16			; r16 <- FF
	out DDRB, r16	; PORTB eh saida
	
loop:
	ser r18			;
loop2:
	ldi r19, 0x10	; adaptar a frequencia de 1Mhz do chip para o padrao 16mhz
loop3:
	dec r19
	brne loop3
	dec r18
	brne loop2
	dec r16			; Decrement r16 (r16 -1)
	brne loop		; se não chegou em 0, (breq = se chegou em zero) , volta pro loop 

	; quando chegar em 0, segue:
	in r17, PINB	; le a porta B
	com r17			; inverte o r17 (complemento de 1)
	out PORTB, r17	; escreve a porta B
	rjmp start