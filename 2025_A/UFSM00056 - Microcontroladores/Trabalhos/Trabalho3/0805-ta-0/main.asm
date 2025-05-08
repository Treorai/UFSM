;
; 0805-ta-0.asm
;
; Created: 08/05/2025 14:13:00
; Author : watto
;
; PWM com Timer1 - Modo 14 (Fast PWM, TOP = ICR1)
; Atualização do duty cycle via interrupção do ADC


.def ADC_channel_flag = R20      ; 0 = canal 0 (PC0), 1 = canal 1 (PC1)

.cseg
.org 0x00
    rjmp RESET
.org 0x002A
    rjmp ADC_ISR

;------------------------------------------------------------
RESET:
    ; Configura PB1 (OC1A) e PB2 (OC1B) como saída
    LDI     R16, 0b00000110 ;ADICIONEI B2 COMO SAIDA
    OUT     DDRB, R16

    ; Configura Timer1 para Fast PWM (modo 14), TOP = ICR1
    LDI     R16, 0b10100010      ; COM1A1=1, COM1B1=1, WGM11=1
    STS     TCCR1A, R16

    LDI     R16, 0b00011001      ; WGM13=1, WGM12=1, Prescaler = 1 (CS10)
    STS     TCCR1B, R16

    ; TOP = 1023
    LDI     R16, LOW(1023)
    STS     ICR1L, R16
    LDI     R16, HIGH(1023)
    STS     ICR1H, R16

    ; Duty inicial = 0
    CLR     R16
    STS     OCR1AL, R16
    STS     OCR1AH, R16
    STS     OCR1BL, R16
    STS     OCR1BH, R16

    ; Configuração inicial do ADC para canal 0 (PC0)
    LDI     R16, 0b01000000      ; REFS0=1 (AVcc), MUX[3:0]=0000 (ADC0)
    STS     ADMUX, R16

    LDI     R16, 0b11101111      ; ADEN=1, ADSC=1, ADATE=1, ADIE=1, ADPS=111 (prescaler 128)
    STS     ADCSRA, R16

    CLR     R16
    STS     ADCSRB, R16          ; Trigger = Free Running

    ; Inicializa flag do canal
    CLR     ADC_channel_flag

    SEI

LOOP:
    RJMP LOOP

;------------------------------------------------------------
; Interrupção do ADC
; Alterna leitura entre ADC0 (PC0) e ADC1 (PC1)
;------------------------------------------------------------
ADC_ISR:
    ; Lê valor do ADC
    LDS     R18, ADCL
    LDS     R19, ADCH

    ; Verifica canal atual
    CPI     ADC_channel_flag, 0
    BREQ    CANAL_0

CANAL_1:
    ; Atualiza OCR1B (LED 2 em PB2)
    STS     OCR1BL, R18
    STS     OCR1BH, R19

    ; Muda para canal 0
    LDI     R16, 0b01000000      ; AVcc, canal 0
    STS     ADMUX, R16

    CLR     ADC_channel_flag
    RJMP    FIM_ADC

CANAL_0:
    ; Atualiza OCR1A (LED 1 em PB1)
    STS     OCR1AL, R18
    STS     OCR1AH, R19

    ; Muda para canal 1
    LDI     R16, 0b01000001      ; AVcc, canal 1
    STS     ADMUX, R16

    LDI     ADC_channel_flag, 1

FIM_ADC:
    RETI
