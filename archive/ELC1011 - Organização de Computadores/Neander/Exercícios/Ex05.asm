;---------------------------------------------------
; Programa: Exercicio 5
; Autor: Wagner S Chitto
; Data: 05-04-2023
;---------------------------------------------------

; Programa

  ;Calcular lados
    lda a      ;AC = a
    add b      ;AC = a+b
    sta ab     ;ab = a+b
    lda b      ;AC = b
    add c      ;AC = c+b
    sta bc     ;bc = c+b
    lda c      ;AC = c
    add a      ;AC = a+c
    sta ac     ;ac = a+c

  ;a<(b+c)
    lda a      ;AC = a
    not        ;AC = not a
    add um     ;AC = -a
    add bc     ;AC = bc-a
    jn bad     ;jmp if a>bc

  ;b<(a+c)
    lda b      ;AC = b
    not        ;AC = not b
    add um     ;AC = -b
    add ac     ;AC = ac-b
    jn bad     ;jmp if b>ac


  ;c<(a+b)
    lda c      ;AC = c
    not        ;AC = not c
    add um     ;AC = -c
    add ab     ;AC = ab-c
    jn bad     ;jmp if c>ab

  ;all tests passed
    lda um     ;ac = 1
    sta delta  ;triangulo ok
    hlt

  bad:
    lda zero   ;ac = 0
    sta delta  ;not triangulo
    hlt


; Definição de variaveis
org 128
  a: db 10        ;lado a
  b: db 7         ;lado b
  c: db 5         ;lado c

  bc: db 0        ;b+c
  ac: db 0        ;a+b
  ab: db 0        ;a+b

  zero: db 0
  um: db 1

  delta: db 0FFh  ;bool
