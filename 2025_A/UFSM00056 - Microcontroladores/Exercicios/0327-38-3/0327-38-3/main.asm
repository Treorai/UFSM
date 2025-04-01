;
; 0327-38-3.asm
;
; Created: 27/03/2025 15:15:58
; Author : watto
;
; Considere que a = 2356 e b=3628. Faça C = a+b. Mostre C nas portas D e B. A parte alta em portD e a parte baixa na port B.


.dseg
	A: .byte 2
	B: .byte 2
	C: .byte 2
.cseg

start:
	ldi r16, 0b10110100	; parte baixa de A
	sts A, r16			; salvei r16 em A[lo] <-r16
	ldi r16, 0b00001000	; parte alta de A
	sts A+1, r16		; A+1 é o endereço da parte alta A[hi] <- r16

	ldi r16, 0b01101100	; parte baixa de B
	sts B, r16			; salvei r16 em B[lo] <- r16
	ldi r16, 0b00001110	; parte alta de B
	sts B+1, r16		; B+1 é o endereço da parte alta B[hi] <- r16

loop:
	lds r16, A			; r16 <- A[lo]
	lds r17, A+1		; r17 <- A[hi]
	lds r18, B			; r18 <- B[lo]
	lds r19, B+1		; r19 <- B[hi]

	add r16, r18		; soma a parte baixa sem carry
	adc r17, r19		; soma a parte alta COM carry

	sts c, r16			; c[lo] <- parte baixa da soma
	sts c+1, r17		; c[hi] <- parte alta da soma

	jmp loop