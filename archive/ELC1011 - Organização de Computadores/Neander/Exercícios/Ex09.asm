;---------------------------------------------------
; Programa: Exercicio 9
; Autor: Wagner S Chitto
; Data: 05-04-2023
;---------------------------------------------------

; Programa
  loop:
  ;soma
    lda c
    add b
    sta c       ;c=+b
  ;decrementa
    lda a
    add mum     ;a--
    sta a
    jz fim      ;a=0?
    jmp loop
  fim:
    hlt

; Definição de variaveis
org 128

  c: db 0
  a: db 3
  b: db 5

  zero: db 0
  um: db 1
  mum: db 0FFh