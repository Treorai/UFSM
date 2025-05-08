;============================================================
; PWM com Timer1 - Modo 14 (Fast PWM, TOP = ICR1)
; Atualiza��o do duty cycle via interrup��o do ADC
;============================================================


.cseg
.org 0x00
    rjmp RESET              ; Reset
.org 0x002A
    rjmp ADC_ISR        ; Interrup��o do ADC

;------------------------------------------------------------
; Rotina Principal
;------------------------------------------------------------
RESET:
    ; Configura PB1 (OC1A) como sa�da
    LDI     R16, 0b00000010
    OUT     DDRB, R16

    ;--------------------------------------------------------
    ; Configura Timer1 para modo 14: Fast PWM, TOP = ICR1
    ;--------------------------------------------------------
    LDI     R16, 0b10000010      ; COM1A1=1, WGM11=1
    STS     TCCR1A, R16

    LDI     R16, 0b00011001      ; WGM13=1, WGM12=1, Prescaler = 1 (CS10)
    STS     TCCR1B, R16

    ; TOP = 1023 (10 bits de resolu��o PWM)
    LDI     R16, LOW(1023)
    STS     ICR1L, R16
    LDI     R16, HIGH(1023)
    STS     ICR1H, R16

    ; Duty inicial = 0
    CLR     R16
    STS     OCR1AL, R16
    STS     OCR1AH, R16

    ;--------------------------------------------------------
    ; Configura��o do ADC - Canal 0, Free Running, interrup��o habilitada
    ;--------------------------------------------------------
    LDI     R16, 0b01000000      ; REFS0 = 1 (AVcc), canal = 0000 (ADC0)
    STS     ADMUX, R16

    LDI     R16, 0b11101111      ; ADEN=1, ADSC=1, ADATE=1, ADIE=1, ADPS2:0=111 (prescaler 128)
    STS     ADCSRA, R16

    CLR     R16
    STS     ADCSRB, R16          ; Trigger = Free Running (ADTS = 000)

    ; Habilita interrup��es globais
    SEI

LOOP:
    RJMP LOOP

;------------------------------------------------------------
; Interrup��o do ADC
; Atualiza OCR1A com o valor de 10 bits do conversor
;------------------------------------------------------------
ADC_ISR:

    ; L� ADCL primeiro, depois ADCH
    LDS     R18, ADCL
    LDS     R19, ADCH

    ; Atualiza OCR1A com valor do ADC
    STS     OCR1AL, R18
    STS     OCR1AH, R19

    RETI
