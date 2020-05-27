; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]


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

;Verificando se Ram[1] = 0
leaw $1, %A
movw (%A), %D
leaw $END, %A
je %D
nop

;Valor final = Ram[0]
leaw $0, %A
movw (%A), %D
leaw $4, %A
movw %D, (%A)

;Contador = Ram[1] - 1
leaw $1, %A
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

;Loop
LOOP:
leaw $4, %A
movw (%A), %D
leaw $0, %A
addw (%A), %D, %D
leaw $4, %A
movw %D, (%A) 
leaw $2, %A
movw (%A), %D
decw %D
leaw $2, %A
movw %D, (%A)
leaw $LOOP, %A
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

