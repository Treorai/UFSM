;============================================================
; Programa: PWM com Timer1 - Modo 14 (Fast PWM, TOP = ICR1)
; MCU: ATmega328P
; PWM em OC1A (PB1 / Digital 9)
; Frequência: F_CPU / (Prescaler * (ICR1 + 1)) = PWM de 1000 ciclos
; Duty cycle: OCR1A = 299 ? 30%
;============================================================


.cseg
.org 0x00
RESET:

    ; Configura PB1 (OC1A) como saída
    LDI     R16, 0b00000010      ; Bit 1 = PB1 ? saída
    OUT     DDRB, R16

    ;--------------------------------------------------------
    ; Configura Timer1 no modo 14: Fast PWM, TOP = ICR1
    ;--------------------------------------------------------

    ; TCCR1A: COM1A1:COM1A0 = 10 (Clear OC1A on compare match)
    ;         WGM11:WGM10 = 10
    LDI     R16, 0b10000010      ; COM1A1=1, COM1A0=0, WGM11=1, WGM10=0
    STS     TCCR1A, R16

    ; TCCR1B: WGM13:WGM12 = 11 (modo 14), Prescaler = 1 (CS10 = 1)
    LDI     R16, 0b00011001      ; WGM13=1, WGM12=1, CS10=1
    STS     TCCR1B, R16

    ; Define TOP com ICR1 = 999 (1000 ciclos)
    LDI     R16, LOW(999)
    STS     ICR1L, R16
    LDI     R16, HIGH(999)
    STS     ICR1H, R16

    ; Define duty cycle com OCR1A = 299 (30%)
    LDI     R16, LOW(299)
    STS     OCR1AL, R16
    LDI     R16, HIGH(299)
    STS     OCR1AH, R16

LOOP:
    RJMP    LOOP
