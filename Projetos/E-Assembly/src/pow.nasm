; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos


;Ram[3] = Ram[1]
leaw $1, %A
movw (%A), %D
leaw $3, %A
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

;Verificando se Ram[1] = 0
leaw $1, %A
movw (%A), %D
leaw $45, %A
je %D
nop

;Valor final = Ram[3]
leaw $3, %A
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
leaw $45, %A
je %D
nop

;Loop
Loop:
leaw $4, %A
movw (%A), %D
leaw $3, %A
addw (%A), %D, %D
leaw $4, %A
movw %D, (%A) 
leaw $2, %A
movw (%A), %D
decw %D
leaw $2, %A
movw %D, (%A)
leaw $31, %A
jg %D
nop

;Ram[0] = Valor final
End:
leaw $4, %A
movw (%A), %D
leaw $0, %A
movw %D, (%A)

;Zerando RAM[2], RAM[3] e Ram[4]
leaw $0, %A
movw %A, %D
leaw $2, %A
movw %D, (%A)
leaw $0, %A
movw %A, %D
leaw $3, %A
movw %D, (%A)
leaw $0, %A
movw %A, %D
leaw $4, %A
movw %D, (%A)

