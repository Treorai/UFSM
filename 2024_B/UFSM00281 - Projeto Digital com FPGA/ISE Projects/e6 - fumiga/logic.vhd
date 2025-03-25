----------------------------------------------------------------------------------
-- Company:        UFSM
-- Engineer:       Wagner S Chitto
-- Registration:   201421493
-- 
-- Create Date:    10:59:28 10/29/2024 
-- Design Name:    Fumiga
-- Description:    Avaliacao 1
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic is
    Port ( clk : in  STD_LOGIC;
			  disp : out STD_LOGIC_VECTOR (6 downto 0);
			  sel : out STD_LOGIC_VECTOR (3 downto 0);
			  switch : in  integer range 0 to 31;
			  joystick : in  integer range 0 to 15 
	 );
end logic;

architecture Behavioral of logic is
constant freq : integer := 100000000;
constant steps : integer := 8; -- led steps for the fumiga
constant matricula : integer := 3+1;

constant tempo : integer := (freq*matricula)/steps;

begin
	
	process(clk)
		variable cont : integer range 0 to 100e6 := 0;
	begin
		if rising_edge(clk)
			then if cont < 100e6 then cont := cont+1;
										else cont := 0;
				  end if; -- if cont < 100e6
				  if cont < tempo
						then disp <= "1111110";
								sel <= "1110";
				  elsif cont < tempo*2
						then disp <= "1111101";
								sel <= "1110";
				  elsif cont < tempo*3
						then disp <= "1111011";
								sel <= "1110";
				  elsif cont < tempo*4
						then disp <= "1110111";
									sel <= "1110";
				  elsif cont < tempo*5
						then disp <= "1110111";
								sel <= "1101";
				  elsif cont < tempo*6
						then disp <= "1101111";
								sel <= "1101";
				  elsif cont < tempo*7
							then disp <= "1011111";
								sel <= "1101";
				  elsif cont < tempo*8
						then disp <= "1111110";
								sel <= "1101";
				  else
				           disp <= "0111111";
								sel <= "0111";
				  end if; -- cont
		end if; -- rising edge
	end process;
end Behavioral;
