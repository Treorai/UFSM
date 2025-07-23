;---------------------------------------------------
; Programa: Exercicio 3
; Autor: Wagner S Chitto
; Data:05-04-2023
;---------------------------------------------------

; Programa
  lda a     ;ac=a
  and um    ;ac= 1 ou 0
  jz par    ;jmp if par
  
  lda zero
  sta res   ;res=0
  hlt

par:
  lda um
  sta res   ;res=1
  hlt
  
; Definição de variaveis
  org 128
  a: db 11
  res: db 2
  um: db 1
  zero: db 0