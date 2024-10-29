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
           disp : out  STD_LOGIC_VECTOR (6 downto 0);
           sel : inout  STD_LOGIC_VECTOR (3 downto 0);
           switch : in  STD_LOGIC_VECTOR (6 downto 0);
			  orientation : in STD_LOGIC;
           btn_u, btn_d, btn_r, btn_l, btn_s : in  STD_LOGIC);
end fumiga;

architecture Behavioral of fumiga is

constant freq : integer := 100000000;
constant steps : integer := 10; -- led steps for the fumiga
constant matricula : integer := 3+1;
constant tempo : integer := (freq*matricula)/steps;
constant customtempo : integer := freq/4;

begin
	--sel <= "1011";
	process(clk, switch)
		variable cont : integer range 0 to 100e6 := 0;
		variable height : integer range 0 to 1 := 1;
	begin
		if switch /= "0000000"
			then
			if rising_edge(clk)
				then if orientation = '0'
					then if cont < 100e6 then cont := cont+1;
											else cont := 0;
					     end if; -- if cont < 100e6
				     else if cont > 1 then cont := 100e6;
											else cont := cont-1;
					     end if; -- if cont > 0
					  end if; -- orientation
					  
					  if cont < customtempo then
					  --controls
						if btn_u = '1' then height := 0;
						elsif btn_d = '1' then height := 1;
						end if;
						
						if btn_r = '1' then
								if sel = "0111" then sel <= "1011";
							elsif sel = "1011" then sel <= "1101";
							else sel <= "1110";
							end if;
						elsif btn_l = '1' then
								if sel = "1110" then sel <= "1101";
							elsif sel = "1101" then sel <= "1011";
							else sel <= "0111";
							end if;
						end if;
						
					  --/controls
							     if height = 0 then disp <= "1111110";
													 else disp <= "0111111";
													 end if;
					  elsif cont < customtempo*2
							then if height = 0 then disp <= "1111101";
													 else disp <= "1111011";
													 end if;
					  elsif cont < customtempo*3
							then if height = 0 then disp <= "0111111";
													 else disp <= "1110111";
													 end if;
					  elsif cont < customtempo*4
							then if height = 0 then disp <= "1011111";
													 else disp <= "1101111";
													 end if;
					  else
								  disp <= "0000110";
					  end if; -- cont
					  
					  
			end if; -- rising edge
		else -- switchs = 0
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
							then disp <= "1110111";
									sel <= "1011";
					  elsif cont < tempo*7
							then disp <= "1101111";
									sel <= "1011";
					  elsif cont < tempo*8
							then disp <= "1011111";
									sel <= "1101";
					  elsif cont < tempo*9
							then disp <= "1111110";
									sel <= "1101";
					  elsif cont < tempo*10
							then disp <= "1111110";
									sel <= "1011";
					  else
								  disp <= "0111111";
									sel <= "0111";
					  end if; -- cont
			end if; -- rising edge
		end if; -- switch avaliacao
	end process;

end Behavioral;

