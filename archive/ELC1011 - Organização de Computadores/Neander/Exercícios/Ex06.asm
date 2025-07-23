;---------------------------------------------------
; Programa: Exercicio 6
; Autor: Wagner S Chitto
; Data: 05-04-2023
;---------------------------------------------------

; Programa
  ;make xor
    lda a      ;ac=a
    not        ;ac=!a
    sta nota   ;nota=!a
    lda b      ;ac=b
    not        ;ac=!a
    sta notb   ;notb=!b
    and a      ;ac= !b and a
    sta aux    ;aux= !b and a
    lda nota   ;ac= !a
    and b      ;ac= !a and b
    or aux     ;ac= (!a and b)  or (a and !b) = xor
    sta axorb

  ;try bits
      and um
      jz jumpbitone    ;pula?
      lda hamming      ;carrega res
      add um           ;+1
      sta hamming      ;salva
    jumpbitone:
      lda axorb        ;reset axorb
      and bit2
      jz jumpbittwo    ;pula?
      lda hamming      ;carrega res
      add um           ;+1
      sta hamming      ;salva
    jumpbittwo:
      lda axorb        ;reset axorb
      and bit3
      jz jumpbitthree  ;pula?
      lda hamming      ;carrega res
      add um           ;+1
      sta hamming      ;salva
    jumpbitthree:
      lda axorb        ;reset axorb
      and bit4
      jz jumpbitfour   ;pula?
      lda hamming      ;carrega res
      add um           ;+1
      sta hamming      ;salva
    jumpbitfour:
      lda axorb        ;reset axorb
      and bit5
      jz jumpbitfive   ;pula?
      lda hamming      ;carrega res
      add um           ;+1
      sta hamming      ;salva
    jumpbitfive:
      lda axorb        ;reset axorb
      and bit6
      jz jumpbitsix    ;pula?
      lda hamming      ;carrega res
      add um           ;+1
      sta hamming      ;salva
    jumpbitsix:
      lda axorb        ;reset axorb
      and bit7
      jz jumpbitseven  ;pula?
      lda hamming      ;carrega res
      add um           ;+1
      sta hamming      ;salva
    jumpbitseven:
      lda axorb        ;reset axorb
      jn jumpbiteight  ;pula?
      hlt
    jumpbiteight:
      lda hamming      ;carrega res
      add um           ;+1
      sta hamming      ;salva
      hlt

; Definição de variaveis
org 128
  hamming: db 0
  a: db 89
  b: db 26
  nota: db 0
  notb: db 0
  aux: db 0
  axorb: db 0
  zero: db 0
  um: db 1

; Definição dos bits
  bit2: db 2
  bit3: db 4
  bit4: db 8
  bit5: db 16
  bit6: db 32
  bit7: db 64
