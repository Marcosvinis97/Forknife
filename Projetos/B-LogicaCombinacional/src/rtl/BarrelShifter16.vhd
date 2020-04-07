library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BarrelShifter16 is
	port ( 
			a:    in  STD_LOGIC_VECTOR(15 downto 0);   -- input vector
			dir:  in  std_logic;                       -- 0=>left 1=>right
			size: in  std_logic_vector(3 downto 0);    -- shift amount
			q:    out STD_LOGIC_VECTOR(15 downto 0));  -- output vector (shifted)
end entity;

architecture rtl of BarrelShifter16 is
	  signal r_Shift1     : std_logic_vector(3 downto 0) := "1000";
	  signal r_Unsigned_L : std_logic_vector(3 downto 0)         := "0000";
	  signal r_Unsigned_R : std_logic_vector(3 downto 0)         := "0000";
	  signal r_Signed_L   : signed(3 downto 0)           := "0000";
	  signal r_Signed_R   : signed(3 downto 0)           := "0000";
   

begin

	with dir select  
	      	--q <= STD_LOGIC_VECTOR(shift_left(unsigned(a),to_integer(unsigned(size)))) when '0',
	      	  --   STD_LOGIC_VECTOR(shift_right(unsigned(a), to_integer(unsigned(size)))) when others;
		--q <= (a(14),a(13),a(12),a(11),a(10),a(9),a(8),a(7),a(6),a(5),a(4),a(3),a(2),a(1),a(0), '0') when '0', 
		  --   ('0',a(15),a(14),a(13),a(12),a(11),a(10),a(9),a(8),a(7),a(6),a(5),a(4),a(3),a(2),a(1)) when others;

	    r_Unsigned_L <= shift_left(unsigned(r_Shift1), 1);
	    r_Signed_L   <= shift_left(signed(r_Shift1), 1);
	     
	    -- Right Shift
	    r_Unsigned_R <= shift_right(unsigned(r_Shift1), 2);
	    r_Signed_R   <= shift_right(signed(r_Shift1), 2);


end architecture;

