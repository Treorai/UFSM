;---------------------------------------------------
; Programa: Exercicio 1
; Autor: Wagner S Chitto
; Data:05-04-2023
;---------------------------------------------------

; Programa
lda b      ;AC = b
not        ;AC = not b
add um     ;AC = -b
add a      ;AC = a-b
sta c      ;c = a-b
hlt

; Definição de variaveis
org 128
a: db 12
b: db 4
c: db 0
um: db 1