----------------------------------------------------------------------------------
-- Company: UFSM00281
-- Engineer: Wagner S Chitto
-- 
-- Create Date:    10:40:37 11/26/2024 
-- Module Name:    main - Behavioral 
-- Project Name:   Trabalho Livre
-- Description:    Display de textos
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( clk : in  STD_LOGIC;
           disp : out  STD_LOGIC_VECTOR (6 downto 0); --{kmwx}
           sel : out  STD_LOGIC_VECTOR (3 downto 0));
end main;

architecture Behavioral of main is
	--components
		component conversor_char is
			port( inchar: in character;
					display: out std_logic_vector(6 downto 0));
		end component;

	--signals
		constant freq : integer := 40e6;
		constant muxtime : integer := 1e6;
		constant stringboladona : string := "   PROJETO DIGITAL DE FPGA   PROFESSOR BAGGIO   MATRICULA 201421493";
														-- STRING SEM 'K' 'M' 'W' 'X'
		
		signal targetchar : character := ' '; -- sinal para enviar ao conversor
		signal scroll_index : integer range 0 to stringboladona'length-1 := 0; -- indice de deslocamento
		signal active_chars : string(1 to 4) := "    "; -- caracteres ativos nos displays


begin
	u1 : conversor_char port map (targetchar, disp);
	--u1 : conversor_char port map (char => targetchar, display => disp);

		
	process(clk)
		variable cont : integer range 0 to freq := 0;
		variable muxcont : integer range 0 to muxtime := 0;
		
	begin
		if rising_edge(clk) then 
			if cont < freq then 
				cont := cont+1;
			else
				cont := 0;
				-- Atualiza o ndice de deslocamento para o scroll
                if scroll_index < stringboladona'length - 1 then
                    scroll_index <= scroll_index + 1;
                else
                    scroll_index <= 0; -- Reinicia o deslocamento
                end if;
					
					-- Atualiza os caracteres ativos nos displays
                for i in 1 to 4 loop
                    if scroll_index + i <= stringboladona'length then
                        active_chars(i) <= stringboladona(scroll_index + i);
                    else
                        active_chars(i) <= ' '; -- Preenche com espaos no final
                    end if;
                end loop;
			end if; -- if(clk)
			
			if muxcont < muxtime then
				muxcont := muxcont+1;
			else
				muxcont := 0;
			end if; -- if(muxtime)
--			
--			if muxcont < muxtime/4 then
--				sel <= "1110";
--				
--			elsif muxcont < muxtime/2 then
--				sel <= "1101";
--				
--			elsif muxcont < (3*muxtime)/4 then
--				sel <= "1011";
--				
--			else
--				sel <= "0111";
--				
--			end if; -- if(mux_selection)
--		
		-- Multiplexao dos displays
            case muxcont / (muxtime / 4) is
                when 0 =>
                    sel <= "0111";
                    targetchar <= active_chars(1); -- Primeiro caractere
                when 1 =>
                    sel <= "1011";
                    targetchar <= active_chars(2); -- Segundo caractere
                when 2 =>
                    sel <= "1101";
                    targetchar <= active_chars(3); -- Terceiro caractere
                when 3 =>
                    sel <= "1110";
                    targetchar <= active_chars(4); -- Quarto caractere
                when others =>
                    sel <= "1111"; -- Nenhum ativo
            end case;
		end if; -- rising_edge(clk)
	end process;
end Behavioral;

