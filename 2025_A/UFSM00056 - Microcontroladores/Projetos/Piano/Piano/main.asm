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
	; Configurar PWM no Timer1
	ldi r16, (1<<COM1A1) | (1<<WGM11)	; OC1A não-invertido, modo PWM
	sts TCCR1A, r16

	ldi r16, (1<<WGM13) | (1<<WGM12) | (1<<CS10) ; modo PWM com ICR1 como TOP, prescaler = 1
	sts TCCR1B, r16

	sbi DDRB, PB1    ; Configurar PB1 (OC1A) como saída
	
	; Configurar entradas
	
	ser r16
	clr r17
	;out DDRB, r16		; portB saida

	; primeiro colunas em low (portd = 0x00 = r17 = in)
	;          linhas em high (portc = 0xff = r16 = out)
	out DDRC, r16
	out DDRD, r17
	;out PORTC, r16		; liga pull up
	out PORTD, r16		; liga pull up

loop:

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
	jmp tecla_G
	sbrc r19, 1
	jmp tecla_P
	sbrc r19, 2
	jmp tecla_fh
	sbrc r19, 3
	jmp tecla_oh
	sbrc r19, 4
	jmp tecla_nula
coluna1:
	sbrc r19, 0
	jmp tecla_T
	sbrc r19, 1
	jmp tecla_L
	sbrc r19, 2
	jmp tecla_dh
	sbrc r19, 3
	jmp tecla_kh
	sbrc r19, 4
	jmp tecla_nula
coluna2:
	sbrc r19, 0
	jmp tecla_F
	sbrc r19, 1
	jmp tecla_O
	sbrc r19, 2
	jmp tecla_eh
	sbrc r19, 3
	jmp tecla_jh
	sbrc r19, 4
	jmp tecla_nula
coluna3:
	sbrc r19, 0
	jmp tecla_D
	sbrc r19, 1
	jmp tecla_K
	sbrc r19, 2
	jmp tecla_sh
	sbrc r19, 3
	jmp tecla_uh
	sbrc r19, 4
	jmp tecla_nula
coluna4:
	sbrc r19, 0
	jmp tecla_E
	sbrc r19, 1
	jmp tecla_J
	sbrc r19, 2
	jmp tecla_wh
	sbrc r19, 3
	jmp tecla_hh
	sbrc r19, 4
	jmp tecla_nula
coluna5:
	sbrc r19, 0
	jmp tecla_S
	sbrc r19, 1
	jmp tecla_U
	sbrc r19, 2
	jmp tecla_ah
	sbrc r19, 3
	jmp tecla_yh
	sbrc r19, 4
	jmp tecla_cch
coluna6:
	sbrc r19, 0
	jmp tecla_W
	sbrc r19, 1
	jmp tecla_H
	sbrc r19, 2
	jmp tecla_nula
	sbrc r19, 3
	jmp tecla_gh
	sbrc r19, 4
	jmp tecla_ph
coluna7:
	sbrc r19, 0
	jmp tecla_A
	sbrc r19, 1
	jmp tecla_Y
	sbrc r19, 2
	jmp tecla_Cc   ; Ç
	sbrc r19, 3
	jmp tecla_th
	sbrc r19, 4
	jmp tecla_lh

fim:
; Tabela de HZ

;TECLA		FREQ	NOTA	ICR1 em 16mhz
;[A]		264hz	C		60606
;[W]		280hz	C#		57142
;[S]		296hz	D		54054
;[E]		314hz	D#		50955
;[D]		333hz	E		48048
;[F]		352hz	F		45454
;[T]		373hz	F#		42842
;[G]		395hz	G		40506
;[Y]		419hz	G#		38186
;[H]		444hz	A		36036
;[U]		470hz	A#		34042
;[J]		498hz	B		32128
;[K]		528hz	C		30303
;[O]		559hz	C#		28623
;[L]		592hz	D		27027
;[P]		628hz	D#		25477
;[Ç]		665hz	E		24060

;[a]		1056hz	C		15151
;[w]		1118hz	C#		14312
;[s]		1185hz	D		13497
;[e]		1256hz	D#		12738
;[d]		1331hz	E		12020
;[f]		1410hz	F		11347
;[t]		1493hz	F#		10721
;[g]		1582hz	G		10113
;[y]		1676hz	G#		9540
;[h]		1776hz	A		9009
;[u]		1882hz	A#		8509
;[j]		1994hz	B		8022
;[k]		2112hz	C		7575
;[o]		2237hz	C#		7153
;[l]		2370hz	D		6751
;[p]		2511hz	D#		6371
;[ç]		2661hz	E		6014

;[ ]		0hz
;[m]		0hz
;[,]		0hz
;[.]		0hz
;[;]		0hz
;[/]		0hz

	jmp loop


; NOTAS

tecla_A:        ; 264 Hz (C)
	ldi r24, low(60606)
	ldi r25, high(60606)
	jmp som

tecla_W:        ; 280 Hz (C#)
	ldi r24, low(57142)
	ldi r25, high(57142)
	jmp som

tecla_S:        ; 296 Hz (D)
	ldi r24, low(54054)
	ldi r25, high(54054)
	jmp som

tecla_E:        ; 314 Hz (D#)
	ldi r24, low(50955)
	ldi r25, high(50955)
	jmp som
	jmp loop

tecla_D:        ; 333 Hz (E)
	ldi r24, low(48048)
	ldi r25, high(48048)
	jmp som

tecla_F:        ; 352 Hz (F)
	ldi r24, low(45454)
	ldi r25, high(45454)
	jmp som

tecla_T:        ; 373 Hz (F#)
	ldi r24, low(42842)
	ldi r25, high(42842)
	jmp som

tecla_G:        ; 395 Hz (G)
	ldi r24, low(40506)
	ldi r25, high(40506)
	jmp som

tecla_Y:        ; 419 Hz (G#)
	ldi r24, low(38186)
	ldi r25, high(38186)
	jmp som

tecla_H:        ; 444 Hz (A)
	ldi r24, low(36036)
	ldi r25, high(36036)
	jmp som

tecla_U:        ; 470 Hz (A#)
	ldi r24, low(34042)
	ldi r25, high(34042)
	jmp som

tecla_J:        ; 498 Hz (B)
	ldi r24, low(32128)
	ldi r25, high(32128)
	jmp som

tecla_K:        ; 528 Hz (C)
	ldi r24, low(30303)
	ldi r25, high(30303)
	jmp som

tecla_O:        ; 559 Hz (C#)
	ldi r24, low(28623)
	ldi r25, high(28623)
	jmp som

tecla_L:        ; 592 Hz (D)
	ldi r24, low(27027)
	ldi r25, high(27027)
	jmp som

tecla_P:        ; 628 Hz (D#)
	ldi r24, low(25477)
	ldi r25, high(25477)
	jmp som

tecla_Cc:       ; 665 Hz (E)
	ldi r24, low(24060)
	ldi r25, high(24060)
	jmp som

tecla_ah:        ; 1056 Hz
	ldi r24, low(15151)
	ldi r25, high(15151)
	jmp som

tecla_wh:        ; 1118 Hz
	ldi r24, low(14312)
	ldi r25, high(14312)
	jmp som

tecla_sh:        ; 1185 Hz
	ldi r24, low(13497)
	ldi r25, high(13497)
	jmp som

tecla_eh:        ; 1256 Hz
	ldi r24, low(12738)
	ldi r25, high(12738)
	jmp som

tecla_dh:        ; 1331 Hz
	ldi r24, low(12020)
	ldi r25, high(12020)
	jmp som

tecla_fh:        ; 1410 Hz
	ldi r24, low(11347)
	ldi r25, high(11347)
	jmp som

tecla_th:        ; 1493 Hz
	ldi r24, low(10721)
	ldi r25, high(10721)
	jmp som

tecla_gh:        ; 1582 Hz
	ldi r24, low(10113)
	ldi r25, high(10113)
	jmp som

tecla_yh:        ; 1676 Hz
	ldi r24, low(9540)
	ldi r25, high(9540)
	jmp som

tecla_hh:        ; 1776 Hz
	ldi r24, low(9009)
	ldi r25, high(9009)
	jmp som

tecla_uh:        ; 1882 Hz
	ldi r24, low(8509)
	ldi r25, high(8509)
	jmp som

tecla_jh:        ; 1994 Hz
	ldi r24, low(8022)
	ldi r25, high(8022)
	jmp som

tecla_kh:        ; 2112 Hz
	ldi r24, low(7575)
	ldi r25, high(7575)
	jmp som

tecla_oh:        ; 2237 Hz
	ldi r24, low(7153)
	ldi r25, high(7153)
	jmp som

tecla_lh:        ; 2370 Hz
	ldi r24, low(6751)
	ldi r25, high(6751)
	jmp som

tecla_ph:        ; 2511 Hz
	ldi r24, low(6371)
	ldi r25, high(6371)
	jmp som

tecla_cch:       ; 2661 Hz
	ldi r24, low(6014)
	ldi r25, high(6014)
	jmp som


tecla_nula:
	clr r24
	clr r25
	jmp som


som:
	sts ICR1L, r24
	sts ICR1H, r25

	; Duty cycle 50%
	lsr r25
	ror r24

	sts OCR1AL, r24
	sts OCR1AH, r25
	jmp loop
