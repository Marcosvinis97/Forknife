/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

/**
 * Traduz mnemônicos da linguagem assembly para códigos binários da arquitetura Z0.
 */
public class Code {

    /**
     * Retorna o código binário do(s) registrador(es) que vão receber o valor da instrução.
     *
     * @param mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 4 bits) com código em linguagem de máquina para a instrução.
     */
    public static String dest(String[] mnemnonic) {
        /* TODO: implementar */

        int l = mnemnonic.length;
        if (l == 2) {
            switch (mnemnonic[1]) {
                case "%A":
                    return "0001";
                case "%D":
                    return "0010";
                case "(%A)":
                    return "0100";
            }
        } else if (l == 3) {
            switch (mnemnonic[2]) {
                case "(%A)":
                    return "0100";
                case "%D":
                    return "0010";
                case "%A":
                    return "0001";
                default:
                    return "0000";
            }

        } else if (l == 4) {
            switch (mnemnonic[3]){
                case "(%A)":
                    return "0100";
                case "%D":
                    return "0010";
                case "%A":
                    return "0001";
                default:
                    return "0000";
            }

        } else {
            return "0000";
        }
        return "0000";
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     *
     * @param mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
        /* TODO: implementar */
        switch (mnemnonic[0]) {
            case "movw":
                switch (mnemnonic[1]) {
                    case "%A":
                        return "000110000";
                    case "%D":
                        return "000001100";
                    case "(%A)":
                        return "001110000";
                    case "$1":
                        return "000111111";
                    case "$0":
                        return "000101010";
                }
            case "notw":
                switch (mnemnonic[1]) {
                    case "%D":
                        return "000001101";
                    case "%A":
                        return "000110001";
                    case "(%A)":
                        return "001110001";
                }
            case "negw":
                switch (mnemnonic[1]) {
                    case "%D":
                        return "000001111";
                    case "%A":
                        return "000110011";
                    case "(%A)":
                        return "001110011";
                }
            case "incw":
                switch (mnemnonic[1]) {
                    case "%A":
                        return "000110111";
                    case "%D":
                        return "000011111";
                    case "(%A)":
                        return "001110111";
                }
            case "andw":
                switch (mnemnonic[1]) {
                    case "(%A)":
                        return "001000000";
                    case "%D":
                        return "000000000";
                    case "%A":
                        return "000000000";
                }
            case "addw":
                switch (mnemnonic[1]) {
                    case "%A":
                        return "000000010";
                    case "(%A)":
                        return "001000010";
                    case "%D":
                        return "000000010";
                    case "$1":
                        return "001110111";
                }
            case "decw":
                switch (mnemnonic[1]) {
                    case "%D":
                        return "000001110";
                    case "%A":
                        return "000110010";
                    case "(%A)":
                        return "001110010";
                }
            case "orw":
                switch (mnemnonic[1]) {
                    case "%D":
                        return "000010101";
                    case "(%A)":
                        return "001010101";
                    case "%A":
                        return "000010101";
                }
            case "subw":
                switch (mnemnonic[1]) {
                    case "%D":
                        return "001010011";
                    case "(%A)":
                        return "001110010";
                }
            case "rsubw":
                if ("%D".equals(mnemnonic[1])) {
                    return "001000111";
                }
            default:
                return "000001100";
        }
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     *
     * @param mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
        /* TODO: implementar */
        switch (mnemnonic[0]) {
            case "jmp":
                return "111";
            case "jle":
                return "110";
            case "jne":
                return "101";
            case "jl":
                return "100";
            case "jge":
                return "011";
            case "je":
                return "010";
            case "jg":
                return "001";
            default:
                return "000";
        }
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     *
     * @param symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
        /* TODO: implementar */
        int value = Integer.parseInt(symbol);

        String binary = Integer.toBinaryString(value);
        return String.format("%1$16s", binary).replace(" ", "0");
    }
}
