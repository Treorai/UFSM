;---------------------------------------------------
; Programa: Exercicio 2
; Autor: Wagner S Chitto
; Data:05-04-2023
;---------------------------------------------------

; Programa
  lda b      ;AC = b
  not        ;AC = not b
  add um     ;AC = -b
  add a      ;AC = a-b
  jn bhigh   ;jump if b is bigger
  
  lda a
  sta c      ;c = a
  hlt

bhigh:
  lda b
  sta c      ;c = b
  hlt

; Definição de variaveis
  org 128
  a: db 12
  b: db 14
  c: db 0
  um: db 1
  zero: db 0