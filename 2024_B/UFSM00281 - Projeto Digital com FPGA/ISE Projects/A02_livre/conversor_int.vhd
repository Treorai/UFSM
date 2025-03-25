library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity conversor_int is
	port( disp: out std_logic_vector(6 downto 0);
			number: in integer range 0 to 15 );
end conversor_int;

architecture Behavioral of conversor_int is
begin
with number select
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
					"1111111" when others;

end Behavioral;
