-- Elementos de Sistemas
-- by Luciano Soares
-- Ram4K.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Ram4K is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR(11 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of Ram4K is

	component Ram512 is
		port(
			clock:   in  STD_LOGIC;
			input:   in  STD_LOGIC_VECTOR(15 downto 0);
			load:    in  STD_LOGIC;
			address: in  STD_LOGIC_VECTOR( 8 downto 0);
			output:  out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component Mux8Way16 is
		port (
				a:   in  STD_LOGIC_VECTOR(15 downto 0);
				b:   in  STD_LOGIC_VECTOR(15 downto 0);
				c:   in  STD_LOGIC_VECTOR(15 downto 0);
				d:   in  STD_LOGIC_VECTOR(15 downto 0);
				e:   in  STD_LOGIC_VECTOR(15 downto 0);
				f:   in  STD_LOGIC_VECTOR(15 downto 0);
				g:   in  STD_LOGIC_VECTOR(15 downto 0);
				h:   in  STD_LOGIC_VECTOR(15 downto 0);
				sel: in  STD_LOGIC_VECTOR( 2 downto 0);
				q:   out STD_LOGIC_VECTOR(15 downto 0));
	end component;

	component DMux8Way is
		port (
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC;
			q4:  out STD_LOGIC;
			q5:  out STD_LOGIC;
			q6:  out STD_LOGIC;
			q7:  out STD_LOGIC);
	end component;

	signal load0, load1, load2, load3, load4, load5, load6, load7 : STD_LOGIC;
	signal output0, output1, output2, output3, output4, output5, output6, output7 : STD_LOGIC_VECTOR(15 downto 0);

begin
	DEMUX0: DMux8Way port map(load, address(8 downto 6), load0, load1, load2, load3, load4, load5, load6, load7);

	ram4k0: Ram512 port map (clock => clock, input => input, load => load0, address => address( 8 downto 0), output => output0);
	ram4k1: Ram512 port map (clock => clock, input => input, load => load1, address => address( 8 downto 0), output => output1);
	ram4k2: Ram512 port map (clock => clock, input => input, load => load2, address => address( 8 downto 0), output => output2);
	ram4k3: Ram512 port map (clock => clock, input => input, load => load3, address => address( 8 downto 0), output => output3);
	ram4k4: Ram512 port map (clock => clock, input => input, load => load4, address => address( 8 downto 0), output => output4);
	ram4k5: Ram512 port map (clock => clock, input => input, load => load5, address => address( 8 downto 0), output => output5);
	ram4k6: Ram512 port map (clock => clock, input => input, load => load6, address => address( 8 downto 0), output => output6);
	ram4k7: Ram512 port map (clock => clock, input => input, load => load7, address => address( 8 downto 0), output => output7);

	MUX0: Mux8Way16 port map(output0, output1, output2, output3, output4, output5, output6, output7, address(8 downto 6), output);

end architecture;
