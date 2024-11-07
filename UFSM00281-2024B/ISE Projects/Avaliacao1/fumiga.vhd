----------------------------------------------------------------------------------
-- Company:        201421493
-- Engineer:       Wagner S Chitto
-- 
-- Create Date:    13:43:17 10/29/2024 
-- Design Name: 
-- Module Name:    fumiga - Behavioral 
-- Project Name:   Avaliacao 1
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fumiga is
    Port ( clk : in  STD_LOGIC;
			  orientation : in STD_LOGIC;
           disp : out  STD_LOGIC_VECTOR (6 downto 0);
           sel : inout  STD_LOGIC_VECTOR (3 downto 0));
end fumiga;

architecture Behavioral of fumiga is

constant freq : integer := 4*100e6; -- freq nexys
constant steps : integer := 10; -- led steps for the fumiga
constant matricula : integer := 3+1; -- periodo
constant tempo : integer := freq/steps; -- tempo loop
constant muxtime : integer := 1e6; -- tempo do mux

begin
	
	process(clk)
		variable cont : integer range 0 to freq := 0;
		variable muxcont : integer range 0 to muxtime := 0;
	begin
			if rising_edge(clk)
				then 
				if orientation = '0' then --ori
					if cont < freq then cont := cont+1;
												else cont := 0;
						  end if; -- if cont < 100e6
						  
						  if muxcont < muxtime then muxcont := muxcont+1;
														else muxcont := 0;
						  end if; -- muxtime
				else
					if cont < 2 then cont := freq;
											else cont := cont-1;
					  end if; -- if cont < 100e6
					  
					  if muxcont < muxtime then muxcont := muxcont+1;
													else muxcont := 0;
					  end if; -- muxtime
				end if; --end orientation
					  if muxcont < muxtime/2
							then 
							sel <= "0111";
								 if cont < freq/matricula then disp <= "1001111";
								  elsif cont < (freq/matricula)*2 then disp <= "0010010";
								  elsif cont < (freq/matricula)*3 then disp <= "0000110";
								  elsif cont < (freq/matricula)*4 then disp <= "1001100";
								  else disp <= "0000001";
								 end if;
					  else
					  
						  if cont < tempo
								then disp <= "0111111";
										sel <= "1110";
						  elsif cont < tempo*2
								then disp <= "1011111";
										sel <= "1110";
						  elsif cont < tempo*3
								then disp <= "1101111";
										sel <= "1110";
						  elsif cont < tempo*4
								then disp <= "1110111";
											sel <= "1110";
						  elsif cont < tempo*5
								then disp <= "1110111";
										sel <= "1101";
						  elsif cont < tempo*6
								then disp <= "1110111";
										sel <= "1011";
						  elsif cont < tempo*7
								then disp <= "1111011";
										sel <= "1011";
						  elsif cont < tempo*8
								then disp <= "1111101";
										sel <= "1011";
						  elsif cont < tempo*9
								then disp <= "0111111";
										sel <= "1011";
						  elsif cont < tempo*10
								then disp <= "0111111";
										sel <= "1101";
						  else
									  disp <= "1111110";
										sel <= "1000";
						  end if; -- cont
					end if; -- mux t/2
			end if; -- rising edge
	end process;

end Behavioral;

