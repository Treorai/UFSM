library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity disp is
	port( disp: out std_logic_vector(6 downto 0);
			output: in integer range 0 to 15 );
end disp;

architecture Behavioral of disp is
begin
with output select
		disp<= 	"0000001" when 0,
					"1001111" when 1,
					"0010010" when 2,
					"0000110" when 3,
					"0111000" when 4,
					"0100100" when 5,
					"0100000" when 6,
					"0001111" when 7,
					"0000000" when 8,
					"0000100" when 9,
					"0001000" when 10,
					"1100000" when 11,
					"0110001" when 12,
					"1000010" when 13,
					"0110000" when 14,
					"0111000" when 15,
					"1111110" when others;

end Behavioral;

