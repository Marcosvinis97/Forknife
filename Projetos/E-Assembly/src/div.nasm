; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos

; if RAM[0]-RAM[1] >= 0:
; RAM[2] = RAM[2] + 1
; RAM[0] = RAM[0]-RAM[1]

WHILE:
leaw $1, %A 
movw (%A), %D 
leaw $0, %A
movw (%A), %A 
subw %A, %D, %A  ; RAM[0] = RAM[0] - RAM[1]
movw %A, %D

;IF RAM[0] >= 0
leaw $IF, %A 
jge %D 
nop
leaw $BREAK, %A 
jmp
nop 

IF:    ;enquanto %D = RAM[0] >=0
leaw $0, %A 
movw %D, (%A)  ;atualiza o valor de RAM[0]
leaw $2, %A 
movw (%A), %D 
addw %D, $1, (%A) ; adc 1 ao valor da RAM[2]
leaw $WHILE, %A
jmp
nop

BREAK: 



















































































