; Elementos de Sistemas : 2018a
; Rafael Corsi
; Hardware : Z0.1
;
; Data :
;    - Dez 2018
; Descrição :
;    - Movimentação de dados da memoria RAM
;
; RAM[0] = RAM[1]
; RAM[1] = RAM[0]
; RAM[3] = 1

; -----------------------
; RAM[0] = RAM[1]
; -----------------------


;Copiando o Valor de 0 para 2

leaw $0, %A
movw (%A), %D

leaw $2, %A
movw %D,(%A)

;Copiando o Valor de 1 para 4

leaw $1, %A
movw (%A), %D

leaw $4, %A
movw %D,(%A)

;Copiando o Valor de 2 para 1

leaw $2, %A
movw (%A), %D

leaw $1, %A
movw %D, (%A)

;Copiando o Valor de 4 para 0

leaw $4, %A
movw (%A), %D

leaw $0, %A
movw %D, (%A)

; -----------------------
; RAM[3] = 1
; -----------------------

;Copiando o Valor de 3 para 0

leaw $1, %A
movw %A, %D

leaw $3, %A
movw %D, (%A)




