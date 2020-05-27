; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

;Se RAM[0] != 0 => RAM[0] = RAM[0], Se RAM[0] = 0 => RAM[0] = 1
leaw $0, %A
movw (%A), %D
leaw $RAM_F, %A
jne %D
nop

;=0
IGUAL_0:
leaw $1, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)

;RAM[7] = RAM[0]
RAM_F:
leaw $0, %A
movw (%A), %D
leaw $7, %A
movw %D, (%A)

;RAM[8] = RAM[0] - 1 se !=0, se nao, RAM[8] = 1
leaw $0, %A
movw (%A), %D
decw %D
leaw $DIFERENTE_1, %A
jne %D
nop

;=0
IGUAL_1:
leaw $1, %A
movw %A, %D
leaw $8, %A
movw %D, (%A)
leaw $LOOP_F, %A
jmp
nop

;!=0
DIFERENTE_1:
leaw $0, %A
movw (%A), %D
decw %D
leaw $8, %A
movw %D, (%A)

;Loop Factorial
LOOP_F:
leaw $7, %A
movw (%A), %D
leaw $5, %A
movw %D, (%A) 
leaw $8, %A
movw (%A), %D
leaw $6, %A
movw %D, (%A) 

;Iniciando contador como 0 na RAM[2]
leaw $0, %A
movw %A, %D
leaw $2, %A
movw %D, (%A)

;Iniciando Valor final como 0 na RAM[4]
leaw $0, %A
movw %A, %D
leaw $4, %A
movw %D, (%A)

;Verificando se Ram[6] = 0
leaw $6, %A
movw (%A), %D
leaw $END, %A
je %D
nop

;Valor final = Ram[5]
leaw $5, %A
movw (%A), %D
leaw $4, %A
movw %D, (%A)

;Contador = Ram[6] - 1
leaw $6, %A
movw (%A), %D
decw %D
leaw $2, %A
movw %D, (%A)

;Verificando se Ram[2] = 0
leaw $2, %A
movw (%A), %D
leaw $END, %A
je %D
nop

;Loop Mult
LOOP_M:
leaw $4, %A
movw (%A), %D
leaw $5, %A
addw (%A), %D, %D
leaw $4, %A
movw %D, (%A) 
leaw $2, %A
movw (%A), %D
decw %D
leaw $2, %A
movw %D, (%A)
leaw $LOOP_M, %A
jg %D
nop

;Ram[3] = Valor final
END:
leaw $4, %A
movw (%A), %D
leaw $3, %A
movw %D, (%A)

;Zerando RAM[2] e Ram[4]
leaw $0, %A
movw %A, %D
leaw $2, %A
movw %D, (%A)
leaw $0, %A
movw %A, %D
leaw $4, %A
movw %D, (%A)

;Guardando o reultado em RAM[7]
leaw $3, %A
movw (%A), %D
leaw $7, %A
movw %D, (%A)

;RAM[8] - 1
leaw $8, %A
movw (%A), %D
decw %D
leaw $8, %A
movw %D, (%A)

;Verificando se RAM[8] = 0
leaw $8, %A
movw (%A), %D
leaw $LOOP_F, %A
jg %D
nop

;Guardando o resultado em RAM[1]
leaw $7, %A
movw (%A), %D
leaw $1, %A
movw %D, (%A)


