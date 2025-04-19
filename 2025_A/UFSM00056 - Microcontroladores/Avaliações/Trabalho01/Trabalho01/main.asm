;
; Trabalho01.asm
;
; Created: 4/18/2025 5:48:14 PM
; Author : Wagner Spinato Chitto
; Matricula: 201421493
;
; OBJETIVO
; Implementar um teclado matricial.
; Multiplicar por 4 (3+1)
; Mostrar em 2 displays de 7 segmentos.
;
; ESQUEMA
; Teclado:  R1  R2  R3  R4  C1  C2  C3
; Pinos:    PC0 PC1 PC2 PC3 PC4 PC5 PC6
;

start:
	ser r16
	out DDRD, r16		; portD saida
	out DDRB, r16		; portB saida flags
							; PB0 = error
							; PB1 = decimal

	ldi r20, 0b1110000	; r20 = colunas high
	ldi r21, 0b0001111	; r21 = colunas low
	
	out DDRC, r21		; R1-R4 como saidas | C1-C3 como entradas
	out PORTC, r20		; portC liga pull up

loop:
	; reset das entradas apos o loop
	out DDRC, r21		; R1-R4 como saidas | C1-C3 como entradas
	out PORTC, r20		; portC liga pull up

	; Todas colunas estao high
	; Quando um botao eh pressionado, a coluna vai para low
	in r16, PINC
	com r16				; r16 recebe bit da coluna ligada

	; Adiantar a mudanca nas portas
	out DDRC, r20		
	out PORTC, r21		; Inversao das portas
	in r17, PINC
	com r17				; r17 recebe bit da linha ligada

	; Testar qual coluna esta ligada
	sbrc r16, 4
	jmp coluna4
	sbrc r16, 5
	jmp coluna5
	sbrc r16, 6
	jmp coluna6
	; Nenhuma coluna ligada
	jmp loop

coluna4:
	ldi r18, 0x01
	jmp testelinha
coluna5:
	ldi r18, 0x02
	jmp testelinha
coluna6:
	ldi r18, 0x04
	jmp testelinha

testelinha:
	sbrc r17, 0
	jmp linha0
	sbrc r17, 1
	jmp linha1
	sbrc r17, 2
	jmp linha2
	sbrc r17, 3
	jmp linha3
	; Nao encontrou linha, imprimir erro
	ldi r17, '2'
	out PORTB, r17
	jmp loop

linha0:
	ldi r19, 0x01
	jmp fim
linha1:
	ldi r19, 0x02
	jmp fim
linha2:
	ldi r19, 0x04
	jmp fim
linha3:
	ldi r19, 0x08
	jmp fim

fim:
	; Shift para gravar em r18 ambos os valores da coluna e da linha
	lsl r18
	lsl r18
	lsl r18
	lsl r18
	or r18, r19
	; Mapa
	; 1= 0b 0001 0100
	; 2= 0b 0010 0100
	; 3= 0b 0100 0100
	; 4= 0b 0001 0010
	; 5= 0b 0010 0010
	; 6= 0b 0100 0010
	; 7= 0b 0001 0001
	; 8= 0b 0010 0001
	; 9= 0b 0100 0001
	; 0= 0b 0001 1000
	; .= 0b 0010 1000
	; e= 0b 0100 1000
	out PORTD, r18
	jmp loop