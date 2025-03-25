library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity conversor_char is
	port( inchar: in character;
			display: out std_logic_vector(6 downto 0));
end conversor_char;

architecture behavioral of conversor_char is
begin
	with inchar select
		 display <= "0000001" when '0',
						"1001111" when '1',
						"0010010" when '2',
						"0000110" when '3',
						"1001100" when '4',
						"0100100" when '5',
						"0100000" when '6',
						"0001111" when '7',
						"0000000" when '8',
						"0000100" when '9',
						
						"0001000" when 'A',
						"1100000" when 'B',
						"1110010" when 'C',
						"1000010" when 'D',
						"0110000" when 'E',
						"0111000" when 'F',
						"0100001" when 'G',
						"1001000" when 'H',
						"1111011" when 'I',
						"1000011" when 'J',
						"1111000" when 'K', -- K (bad format)
						"1110001" when 'L',
						"0101010" when 'M', -- M (bad format)
						"1101010" when 'N',
						"1100010" when 'O',
						"0011000" when 'P',
						"0001100" when 'Q',
						"1111010" when 'R',
						"0100100" when 'S',
						"1110000" when 'T',
						"1000001" when 'U',
						"1100011" when 'V',
						"0100011" when 'W', -- W (bad format)
						"0011100" when 'X', -- X (bad format)
						"1011000" when 'Y',
						"0110110" when 'Z',
						"1111111" when others;
end behavioral;

