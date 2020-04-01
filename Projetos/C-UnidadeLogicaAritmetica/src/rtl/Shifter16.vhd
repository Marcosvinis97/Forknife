library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shifter16 is
	port ( 
			a:    in  STD_LOGIC_VECTOR(15 downto 0);   -- input vector
			dir:  in  std_logic;                       -- 0=>left 1=>right
			q:    out STD_LOGIC_VECTOR(15 downto 0));  -- output vector (shifted)
end entity;

architecture rtl of Shifter16 is
begin
    
    q(15 downto 0) <=  a(14 downto 0) & '0' when dir = '0' else  
                       '0' & a(15 downto 1) ;

end architecture;
