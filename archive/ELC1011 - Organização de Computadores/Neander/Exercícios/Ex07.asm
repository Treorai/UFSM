;---------------------------------------------------
; Programa: Exercicio 7
; Autor: Wagner S Chitto
; Data: 05-04-2023
;---------------------------------------------------

; Programa
  loop:
  ;check parity
    lda a
    and um
    jz par        ;é par
                  ;é impar
    lda res
    add a
    sta res       ;res =+ a
  par:
    lda a
    add um
    sta a         ;a++
  ;a>b?
    lda a
    not
    add um
    add b         ;b-a
    jn fim        ;a bigger
  ;dinovo
    jmp loop
  fim:
    hlt

; Definição de variaveis
org 128

  res: db 0
  a: db 3
  b: db 7

  zero: db 0
  um: db 1