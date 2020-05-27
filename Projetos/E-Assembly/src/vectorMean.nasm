; ------------------------------------
; Calcule a média dos valores de um vetor
; que possui inicio em RAM[5] e tamanho
; defindo em RAM[4],
;
; 1. Salve a soma em RAM[1]
; 2. Salve a média em RAM[0]
; 
; ------------------------------------
; antes       | depois
;             |
; RAM[0]:     | RAM[0]:  2  : média 
; RAM[1]:     | RAM[1]:  8  : soma
; RAM[2]:     | RAM[2]:  
; RAM[3]:     | RAM[3]:  
; RAM[4]:  4  | RAM[4]:  4 
; RAM[5]:  1  | RAM[5]:  1 - 
; RAM[6]:  2  | RAM[6]:  2 | vetor
; RAM[7]:  1  | RAM[7]:  1 |
; RAM[8]:  4  | RAM[8]:  4 -
; ------------------------------------


leaw $0, %A
movw %A, (%A)

leaw $0, %A
movw %A, %D
leaw $1, %A
movw %D, (%A)

; colocar tamanho do vetor na ram 2 para ir subtraindo
leaw $4, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A)

; na ram 3 vai ficar o que eu vou somando 1 pra percorrer as ram
;zerar essa ram
leaw $0, %A
movw %A, %D
leaw $3, %A
movw %D, (%A)

VOLTA:
leaw $2, %A
movw (%A), %D
leaw $FIM, %A
je %D
nop
leaw $5, %A
movw %A, %D
leaw $3, %A
addw (%A), %D, %A
movw (%A), %D
leaw $1, %A
addw %D, (%A), %D
movw %D, (%A)

;decrementa do tamanho do vetor
leaw $2, %A
movw (%A), %D
decw %D
movw %D, (%A)

; incrementa o que percorre as rams
leaw $3, %A
movw (%A), %D
incw %D
movw %D, (%A)
leaw $VOLTA, %A
jmp
nop

FIM:


leaw $1, %A
movw (%A), %D
leaw $3, %A
movw %D, (%A)

WHILE:
leaw $3, %A
movw (%A), %D
leaw $ACABA, %A
je
nop
leaw $4, %A
movw (%A), %D
leaw $3, %A
subw (%A), %D, %D
movw %D, (%A)

leaw $0, %A
movw (%A), %D
incw %D
leaw $0, %A
movw %D, (%A)
leaw $WHILE, %A
jmp
nop
ACABA:

