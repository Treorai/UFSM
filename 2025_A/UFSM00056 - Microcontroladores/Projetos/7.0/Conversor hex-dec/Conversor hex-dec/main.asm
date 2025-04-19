;
; Conversor hex-dec.asm
;
; Created: 01-Apr-25 16:44:28
; Author : Watto
;
; Projeto de display conversor de entrada binaria para decimal de 0 a 255

start:
    clr r16
    out DDRB, r16   ; PORTB como entrada

    ser r16         ; r16
	out PORTB, r16	; ativa pull ups
    out DDRD, r16   ; PORTD -> saida (unidades)
    out DDRC, r16   ; PORTC -> saida (dezenas)

loop:
    in r16, PINB    ; r16 = input

    clr r19			; r19 = centenas
    clr r18			; r18 = dezenas

    ; calcula centenas
check_hundreds:
    cpi r16, 100
    brlo skip_hundreds    ; Se <100, pula
    subi r16, 100
    inc r19
    rjmp check_hundreds   ; Repete ate r16 < 100

skip_hundreds:
    ; calcula dezenas
check_tens:
    cpi r16, 10
    brlo skip_tens        ; Se <10, pula
    subi r16, 10
    inc r18
    rjmp check_tens       ; Repete até r16 < 10

skip_tens:
    ; agora r16 contem as unidades
    mov r17, r16

	; shift r19 para os bits maiores de r17
	lsl r19
	lsl r19
	lsl r19
	lsl r19
	lsl r19
	lsl r19

	or r17, r19

    ; print
    out PORTD, r17		; unidades em PORTD
    out PORTC, r18		; dezenas no PORTC

    rjmp loop 