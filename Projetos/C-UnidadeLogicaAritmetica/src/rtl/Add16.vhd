-- Elementos de Sistemas
-- by Luciano Soares
-- Add16.vhd

-- q dois valores de 16 bits
-- ignorando o carry mais significativo

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC_VECTOR(15 downto 0);
    q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Add16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.
  component FullAdder is
    port(
      a,b,c:      in STD_LOGIC;   -- entradas
      soma,vaium: out STD_LOGIC   -- sum e carry
    );
  end component;

  signal vaium : std_logic_vector(15 downto 0);

begin
  -- Implementação vem aqui!

    SC0: FullAdder PORT MAP ('0', a (0), b(0), q(0), vaium(0));
    SC1: FullAdder PORT MAP (vaium(0), a(1), b(1), q(1), vaium(1));
    SC2: FullAdder PORT MAP (vaium(1), a(2), b(2), q(2), vaium(2));
    SC3: FullAdder PORT MAP (vaium(2), a(3), b(3), q(3), vaium(3));
    SC4: FullAdder PORT MAP (vaium(3), a(4), b(4), q(4), vaium(4));
    SC5: FullAdder PORT MAP (vaium(4), a(5), b(5), q(5), vaium(5));
    SC6: FullAdder PORT MAP (vaium(5), a(6), b(6), q(6), vaium(6));
    SC7: FullAdder PORT MAP (vaium(6), a(7), b(7), q(7), vaium(7));
    SC8: FullAdder PORT MAP (vaium(7), a(8), b(8), q(8), vaium(8));
    SC9: FullAdder PORT MAP (vaium(8), a(9), b(9), q(9), vaium(9));
    SC10: FullAdder PORT MAP (vaium(9), a(10), b(10), q(10), vaium(10));
    SC11: FullAdder PORT MAP (vaium(10), a(11), b(11), q(11), vaium(11));
    SC12: FullAdder PORT MAP (vaium(11), a(12), b(12), q(12), vaium(12));
    SC13: FullAdder PORT MAP (vaium(12), a(13), b(13), q(13), vaium(13));
    SC14: FullAdder PORT MAP (vaium(13), a(14), b(14), q(14), vaium(14));
    SC15: FullAdder PORT MAP (vaium(14), a(15), b(15), q(15), vaium(16));
end architecture;