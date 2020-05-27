; Arquivo: isEven.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; par. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.

; colocando 1 na RAM[0]
leaw $1, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)

; passando o valor da RAM[5] para a RAM[1]
leaw $1, %A
movw %A, %D
leaw $8, %A
movw %D, (%A)

BACK:
leaw $8, %A
movw (%A), %D
leaw $5, %A
andw %D, (%A), %D
leaw $END, %A
je
nop
leaw $0, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)

; quando vai subtraindo e dá 0 é par pode acabar porque a RAM[0] já está com 1
END:
