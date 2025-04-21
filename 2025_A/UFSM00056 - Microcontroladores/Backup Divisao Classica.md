# Backup Divisao Classica

```asm
	ldi r16, 16    ; contador de bits

div_loop:
	;desloca [r29:r28] para a esquerda, resto entra
	lsl r28         ; <<1
	rol r29
	rol r23         ; resto recebe bit deslocado

	cp r23, r22		; compara resto com divisor
	brlo no_sub
	sub r23, r22	; subtrai divisor do resto

	;ajusta quociente (desloca 1 para a esquerda + 1)
	lsl r24
	rol r25
	ori r24, 0x01   ; coloca 1 no bit menos significativo
	rjmp next

no_sub:
	lsl r24			; desloca quociente sem somar 1
	rol r25

next:
	dec r16
	brne div_loop
```