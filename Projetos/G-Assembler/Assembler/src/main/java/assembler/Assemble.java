/**
 * Curso: Elementos de Sistemas
 * Arquivo: Assemble.java
 * Created by Luciano <lpsoares@insper.edu.br>
 * Date: 04/02/2017
 * <p>
 * 2018 @ Rafael Corsi
 */

package assembler;

import java.io.*;

/**
 * Faz a geração do código gerenciando os demais módulos
 */
public class Assemble {
    private String inputFile;              // arquivo de entrada nasm
    File hackFile = null;                  // arquivo de saída hack
    private PrintWriter outHACK = null;    // grava saida do código de máquina em Hack
    boolean debug;                         // flag que especifica se mensagens de debug são impressas
    private SymbolTable table;             // tabela de símbolos (variáveis e marcadores)

    /*
     * inicializa assembler
     * @param inFile
     * @param outFileHack
     * @param debug
     * @throws IOException
     */
    public Assemble(String inFile, String outFileHack, boolean debug) throws IOException {
        this.debug = debug;
        inputFile = inFile;
        hackFile = new File(outFileHack);                      // Cria arquivo de saída .hack
        outHACK = new PrintWriter(new FileWriter(hackFile));  // Cria saída do print para
        // o arquivo hackfile
        table = new SymbolTable();                          // Cria e inicializa a tabela de simbolos
    }

    /**
     * primeiro passo para a construção da tabela de símbolos de marcadores (labels)
     * varre o código em busca de novos Labels e Endereços de memórias (variáveis)
     * e atualiza a tabela de símbolos com os endereços (table).
     * <p>
     * Dependencia : Parser, SymbolTable
     *
     * @return
     */
    public SymbolTable fillSymbolTable() throws FileNotFoundException, IOException {

        Parser parser = new Parser(inputFile);

        int romAddress = 0;
        while (parser.advance()) {

            if ( parser.commandType(parser.command()).equals(Parser.CommandType.L_COMMAND) ) {
                String label = parser.label(parser.command());
                if (!table.contains(label)) {
                    table.addEntry(label, romAddress);
                }
            } else {
                romAddress++;
            }
        }

        parser.close();

        // a segunda passada pelo código deve buscar pelas variáveis
        // leaw $var1, %A
        // leaw $X, %A
        // para cada nova variável deve ser alocado um endereço,
        // começando na RAM[15] e seguindo em diante.
        Parser newParser = new Parser(inputFile);
        int ramAddress = 16;
        while (newParser.advance()) {
            if (newParser.commandType(newParser.command()) == Parser.CommandType.A_COMMAND) {
                String symbol = newParser.symbol(newParser.command());
                if (!Character.isDigit(symbol.charAt(0))) {
                    /* TODO: implementar */
                    // deve verificar se tal símbolo já existe na tabela,
                    // se não, deve inserir associando um endereço de
                    // memória RAM a ele.
                    if (!table.contains(symbol)) {
                        table.addEntry(symbol, ramAddress);
                        ramAddress++;
                    }
                }
            }
        }

        parser.close();
        return table;
    }


    /**
     * Segundo passo para a geração do código de máquina
     * Varre o código em busca de instruções do tipo A, C
     * gerando a linguagem de máquina a partir do parse das instruções.
     * <p>
     * Dependencias : Parser, Code
     */
    public void generateMachineCode() throws FileNotFoundException, IOException {

        Parser parser = new Parser(inputFile);  // abre o arquivo e aponta para o começo
        String instruction = "";

        while (parser.advance()) {
            String[] instructionSet = parser.instruction(parser.command());
            String toPrint = "";
            for (String i : instructionSet) {
                toPrint += " " + i;
            }
            System.out.println("");
            System.out.println("InstrunctionSet: " + toPrint.trim());
            System.out.println("Command type: " + parser.commandType(parser.command()));
            switch (parser.commandType(parser.command())) {
                /* TODO: implementar */
                case C_COMMAND:
                    String jump = Code.jump(instructionSet);
                    System.out.println("jump: " + jump);
                    String destino = Code.dest(instructionSet);
                    System.out.println("dest: " + destino);
                    String calculo = Code.comp(instructionSet);
                    System.out.println("comp: " + calculo);
                    instruction += "10" + calculo + destino + jump;
//                    System.out.println("instruction: " + instruction);
                    break;

                case A_COMMAND:
                    String symbol = parser.symbol(parser.command());
                    String bin;

                    if (table.contains(symbol)) {
                        int address = table.getAddress(symbol);
                        System.out.println("Symbol: "+symbol+" | address: " + address);
                        bin = "00" + Code.toBinary(Integer.toString(address));;
//                        System.out.println("bin: " + bin);
                    } else {
                        bin = "00" + Code.toBinary(symbol);
//                        System.out.println("[else] bin: " + bin);
                    }
                    instruction = bin;
                    break;

                default:
                    continue;
            }
            System.out.println("finalInstruction: " + instruction);
            // Escreve no arquivo .hack a instrução
            if (outHACK != null) {
                outHACK.println(instruction);
            }
            instruction = "";
        }
    }

    /**
     * Fecha arquivo de escrita
     */
    public void close() throws IOException {
        if (outHACK != null) {
            outHACK.close();
        }
    }

    /**
     * Remove o arquivo de .hack se algum erro for encontrado
     */
    public void delete() {
        try {
            if (hackFile != null) {
                hackFile.delete();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
