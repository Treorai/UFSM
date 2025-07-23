;---------------------------------------------------
; Programa: Exercicio 4
; Autor: Wagner S Chitto
; Data:05-04-2023
;---------------------------------------------------

; Programa
  lda a      ;AC = a
  jn ngtv    ;jump if a negative

fim:
  sta c      ;c = a
  hlt

ngtv:
  not        ;AC = not a
  add um     ;AC = a is positive
  jmp fim
  
  
; Definição de variaveis
  org 128
  a: db 0FEh  ; -2d
  c: db 0
  um: db 1
  zero: db 0