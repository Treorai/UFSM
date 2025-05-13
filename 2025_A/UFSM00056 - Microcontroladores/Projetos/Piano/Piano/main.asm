;
; Piano.asm
;
; Created: 30-Apr-25 17:25:04
; Author : Watto
;

; COLUNAS (8bits) = PORTD
; LINHAS  (5bits) = PORTC

.org 0x0000

start:
	; === Configurar PWM no Timer1 ===
	ldi r16, (1<<COM1A1) | (1<<WGM11)	; OC1A não-invertido, modo PWM
	sts TCCR1A, r16

	ldi r16, (1<<WGM13) | (1<<WGM12) | (1<<CS10) ; modo PWM com ICR1 como TOP, prescaler = 1
	sts TCCR1B, r16

	sbi DDRB, PB1    ; Configurar PB1 (OC1A) como saída (buzzer)
	
	
	
	ser r16
	clr r17
	out DDRB, r16		; portB saida

	; primeiro colunas em low (portd = 0x00 = r17 = in)
	;          linhas em high (portc = 0xff = r16 = out)
	out DDRC, r16
	out DDRD, r17
	;out PORTC, r16		; liga pull up
	out PORTD, r16		; liga pull up

loop:

out PORTB, r24
	; reset entradas apos o loop
	out DDRC, r16
	out PORTC, r17		; linhas low

	out DDRD, r17
	out PORTD, r16		; portd liga pull up

	; Quando um botao eh pressionado, a coluna vai para low
	in r18, PIND
	com r18				; r18 recebe bit da coluna ligada


	;cpi r18, 0x00
	;breq loop			; nenhuma tecla = volta

	out DDRC, r17
	out DDRD, r16
	out PORTC, r16		;portc liga pull up
	out PORTD, r17

	in r19, PINC
	com r19				; r19 recebe bit da linha ligada

	;cpi r19, 0x00
	;breq loop			; nenhuma ligada = volta

	; Testar qual coluna esta ligada
	sbrc r18, 0
	jmp coluna0
	sbrc r18, 1
	jmp coluna1
	sbrc r18, 2
	jmp coluna2
	sbrc r18, 3
	jmp coluna3
	sbrc r18, 4
	jmp coluna4
	sbrc r18, 5
	jmp coluna5
	sbrc r18, 6
	jmp coluna6
	sbrc r18, 7
	jmp coluna7
	; Nenhuma coluna ligada
	jmp loop


coluna0:
	sbrc r19, 0
	rcall tecla_G
	sbrc r19, 1
	rcall tecla_P
	sbrc r19, 2
	rcall tecla_fh
	sbrc r19, 3
	rcall tecla_oh
	sbrc r19, 4
	rcall tecla_nula
coluna1:
	sbrc r19, 0
	rcall tecla_T
	sbrc r19, 1
	rcall tecla_L
	sbrc r19, 2
	rcall tecla_dh
	sbrc r19, 3
	rcall tecla_kh
	sbrc r19, 4
	rcall tecla_nula
coluna2:
	sbrc r19, 0
	rcall tecla_F
	sbrc r19, 1
	rcall tecla_O
	sbrc r19, 2
	rcall tecla_eh
	sbrc r19, 3
	rcall tecla_jh
	sbrc r19, 4
	rcall tecla_nula
coluna3:
	sbrc r19, 0
	rcall tecla_D
	sbrc r19, 1
	rcall tecla_K
	sbrc r19, 2
	rcall tecla_sh
	sbrc r19, 3
	rcall tecla_uh
	sbrc r19, 4
	rcall tecla_nula
coluna4:
	sbrc r19, 0
	rcall tecla_E
	sbrc r19, 1
	rcall tecla_J
	sbrc r19, 2
	rcall tecla_wh
	sbrc r19, 3
	rcall tecla_hh
	sbrc r19, 4
	rcall tecla_nula
coluna5:
	sbrc r19, 0
	rcall tecla_S
	sbrc r19, 1
	rcall tecla_U
	sbrc r19, 2
	rcall tecla_ah
	sbrc r19, 3
	rcall tecla_yh
	sbrc r19, 4
	rcall tecla_cch
coluna6:
	sbrc r19, 0
	rcall tecla_W
	sbrc r19, 1
	rcall tecla_H
	sbrc r19, 2
	rcall tecla_nula
	sbrc r19, 3
	rcall tecla_gh
	sbrc r19, 4
	rcall tecla_ph
coluna7:
	sbrc r19, 0
	rcall tecla_A
	sbrc r19, 1
	rcall tecla_Y
	sbrc r19, 2
	rcall tecla_Cc   ; Ç
	sbrc r19, 3
	rcall tecla_th
	sbrc r19, 4
	rcall tecla_lh

fim:
; Tabela de HZ
;[A]		264hz C
;[W]		280hz C#
;[S]		296hz D
;[E]		314hz D#
;[D]		333hz E
;[F]		352hz F
;[T]		373hz F#
;[G]		395hz G
;[Y]		419hz G#
;[H]		444hz A
;[U]		470hz A#
;[J]		498hz B
;[K]		528hz C
;[O]		559hz C#
;[L]		592hz D
;[P]		628hz D#
;[Ç]		665hz E

;[a]		1056hz C
;[w]		1118hz C#
;[s]		1185hz D
;[e]		1256hz D#
;[d]		1331hz E
;[f]		1410hz F
;[t]		1493hz F#
;[g]		1582hz G
;[y]		1676hz G#
;[h]		1776hz A
;[u]		1882hz A#
;[j]		1994hz B
;[k]		2112hz C
;[o]		2237hz C#
;[l]		2370hz D
;[p]		2511hz D#
;[ç]		2661hz E

;[ ]		0hz
;[m]		0hz
;[,]		0hz
;[.]		0hz
;[;]		0hz
;[/]		0hz

	jmp loop


; === NOTAS ===

tecla_A:        ; 264 Hz (C)
	ldi r24, low(7575)
	ldi r25, high(7575)
	rcall som
	ret

tecla_W:        ; 280 Hz (C#)
	ldi r24, low(6134)
	ldi r25, high(6134)
	rcall som
	ret

tecla_S:        ; 296 Hz (D)
	ldi r24, low(5719)
	ldi r25, high(5719)
	rcall som
	ret

tecla_E:        ; 314 Hz (D#)
	ldi r24, low(5324)
	ldi r25, high(5324)
	rcall som
	ret

tecla_D:        ; 333 Hz (E)
	ldi r24, low(4999)
	ldi r25, high(4999)
	rcall som
	ret

tecla_F:        ; 352 Hz (F)
	ldi r24, low(4669)
	ldi r25, high(4669)
	rcall som
	ret

tecla_T:        ; 373 Hz (F#)
	ldi r24, low(4359)
	ldi r25, high(4359)
	rcall som
	ret

tecla_G:        ; 395 Hz (G)
	ldi r24, low(4057)
	ldi r25, high(4057)
	rcall som
	ret

tecla_Y:        ; 419 Hz (G#)
	ldi r24, low(3731)
	ldi r25, high(3731)
	rcall som
	ret

tecla_H:        ; 444 Hz (A)
	ldi r24, low(3499)
	ldi r25, high(3499)
	rcall som
	ret

tecla_U:        ; 470 Hz (A#)
	ldi r24, low(3249)
	ldi r25, high(3249)
	rcall som
	ret

tecla_J:        ; 498 Hz (B)
	ldi r24, low(3009)
	ldi r25, high(3009)
	rcall som
	ret

tecla_K:        ; 528 Hz (C)
	ldi r24, low(2776)
	ldi r25, high(2776)
	rcall som
	ret

tecla_O:        ; 559 Hz (C#)
	ldi r24, low(2563)
	ldi r25, high(2563)
	rcall som
	ret

tecla_L:        ; 592 Hz (D)
	ldi r24, low(2375)
	ldi r25, high(2375)
	rcall som
	ret

tecla_P:        ; 628 Hz (D#)
	ldi r24, low(2165)
	ldi r25, high(2165)
	rcall som
	ret

tecla_Cc:       ; 665 Hz (E)
	ldi r24, low(2008)
	ldi r25, high(2008)
	rcall som
	ret

; === NOTAS AGUDAS ===

tecla_ah:        ; 1056 Hz
	ldi r24, low(1893)
	ldi r25, high(1893)
	rcall som
	ret

tecla_wh:        ; 1118 Hz
	ldi r24, low(1779)
	ldi r25, high(1779)
	rcall som
	ret

tecla_sh:        ; 1185 Hz
	ldi r24, low(1673)
	ldi r25, high(1673)
	rcall som
	ret

tecla_eh:        ; 1256 Hz
	ldi r24, low(1580)
	ldi r25, high(1580)
	rcall som
	ret

tecla_dh:        ; 1331 Hz
	ldi r24, low(1490)
	ldi r25, high(1490)
	rcall som
	ret

tecla_fh:        ; 1410 Hz
	ldi r24, low(1417)
	ldi r25, high(1417)
	rcall som
	ret

tecla_th:        ; 1493 Hz
	ldi r24, low(1339)
	ldi r25, high(1339)
	rcall som
	ret

tecla_gh:        ; 1582 Hz
	ldi r24, low(1259)
	ldi r25, high(1259)
	rcall som
	ret

tecla_yh:        ; 1676 Hz
	ldi r24, low(1180)
	ldi r25, high(1180)
	rcall som
	ret

tecla_hh:        ; 1776 Hz
	ldi r24, low(1123)
	ldi r25, high(1123)
	rcall som
	ret

tecla_uh:        ; 1882 Hz
	ldi r24, low(1062)
	ldi r25, high(1062)
	rcall som
	ret

tecla_jh:        ; 1994 Hz
	ldi r24, low(957)
	ldi r25, high(957)
	rcall som
	ret

tecla_kh:        ; 2112 Hz
	ldi r24, low(946)
	ldi r25, high(946)
	rcall som
	ret

tecla_oh:        ; 2237 Hz
	ldi r24, low(892)
	ldi r25, high(892)
	rcall som
	ret

tecla_lh:        ; 2370 Hz
	ldi r24, low(843)
	ldi r25, high(843)
	rcall som
	ret

tecla_ph:        ; 2511 Hz
	ldi r24, low(795)
	ldi r25, high(795)
	rcall som
	ret

tecla_cch:       ; 2661 Hz
	ldi r24, low(750)
	ldi r25, high(750)
	rcall som
	ret

; === TECLAS MUDAS ===
tecla_nula:
	rcall silencio
	ret


som:
	sts ICR1L, r24
	sts ICR1H, r25

	; Duty cycle 50%
	lsr r25
	ror r24
	sts OCR1AL, r24
	sts OCR1AH, r25

	ret


silencio:
	ldi r16, 0
	sts TCCR1A, r16
	sts TCCR1B, r16
	cbi PORTB, PB1
	ret
