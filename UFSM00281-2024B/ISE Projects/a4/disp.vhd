library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity disp is
	port( e : in std_logic_vector(3 downto 0);
			d: out std_logic_vector(6 downto 0);
			sel: out std_logic_vector(3 downto 0) );
end disp;

architecture Behavioral of disp is
begin
sel <= "1110";
with e select
	d<= 	"0000001" when "0000",
					"1001111" when "0001",
					"0010010" when "0010",
					"0000110" when "0011",
					"0111000" when "0100",
					"0100100" when "0101",
					"0100000" when "0110",
					"0001111" when "0111",
					"0000000" when "1000",
					"0000100" when "1001",
					"1111110" when others;

end Behavioral;

