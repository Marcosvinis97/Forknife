-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: PC.vhd
-- date: 4/4/2017

-- Contador de 16bits
-- if (reset[t] == 1) out[t+1] = 0
-- else if (load[t] == 1)  out[t+1] = in[t]
-- else if (inc[t] == 1) out[t+1] = out[t] + 1
-- else out[t+1] = out[t]

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

use IEEE.std_logic_unsigned.all; --para somar

entity PC is
    port(
        clock     : in  STD_LOGIC;
        increment : in  STD_LOGIC;
        load      : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);
        output    : out STD_LOGIC_VECTOR(15 downto 0)
    );
end entity;

architecture arch of PC is

 signal muxOut : std_logic_vector(15 downto 0);

  component Inc16 is
      port(
          a   :  in STD_LOGIC_VECTOR(15 downto 0);
          q   : out STD_LOGIC_VECTOR(15 downto 0)
          );
  end component;

  component Register8 is
      port(
          clock:   in STD_LOGIC;
          input:   in STD_LOGIC_VECTOR(7 downto 0);
          load:    in STD_LOGIC;
          output: out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

begin

	process(reset,load,increment, input, output)
		begin
			if (reset = '1') 	then
				output <= output;  --output representando 0
			elsif (load = '1') 	then
				output <= input;
			elsif (increment = '1') then
				output <= std_logic_vector( unsigned(output + 1) );
			else
				output <= output ;
			end if;
	end process;

end architecture;
