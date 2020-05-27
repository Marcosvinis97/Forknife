; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
;
; Calcula o resto da divisão (modulus) entre RAM[0] por RAM[1]
; e armazena o resultado na RAM[2].
;
; 4  % 3 = 1
; 10 % 7 = 3

leaw $0, %A         ; A = 0 
movw (%A), %D       ; D = ram[A|0]

while:              ; loop principal
leaw $1, %A         ; A = 1
subw %D, (%A), %D   ; D = ram[1] - ram[A|0]
leaw $end, %A       ; A = label[$end]
jl %D              ; vai para label[$end] se D < 0
nop                 

leaw $2, %A         ; A = 2
movw %D, (%A)       ; ram[A|2] = D (guarda o valor de D em ram[3])
leaw $while, %A     ; A = label[$while]
jg %D               ; vai para label[$while] se D > 0
nop

END:
nop