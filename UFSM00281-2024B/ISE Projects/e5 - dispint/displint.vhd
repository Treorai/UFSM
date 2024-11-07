library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- Para operaes aritmticas

entity displint is
    Port ( e : in  integer range 0 to 15;
           ef : in  integer range 0 to 15;
           g : in  integer range 0 to 15; -- Boto para operao
           sel : out  STD_LOGIC_VECTOR (3 downto 0);
           d : out  STD_LOGIC_VECTOR (6 downto 0));
end displint;

architecture Behavioral of displint is
    signal num1, num2, result : integer range 0 to 15;
begin
    process(e, ef, g) -- Sensibilidade a todos os sinais relevantes
    begin
        num1 <= e; -- Captura o primeiro nmero
        num2 <= ef; -- Captura o segundo nmero

        -- Verifica se algum boto est apertado
        if (g > 0) then
            result <= num1 - num2; -- Subtrao
        else
            result <= num1 + num2; -- Soma
        end if;

        -- Limita o resultado entre 0 e 15
        if result < 0 then
            result <= 0;
        elsif result > 15 then
            result <= 15;
        end if;

        -- Atualiza a seleo e a sada do display
        sel <= "1110"; -- Configurao da seleo
        case result is
            when 0 => d <= "0000001";
            when 1 => d <= "1001111";
            when 2 => d <= "0010010";
            when 3 => d <= "0000110";
            when 4 => d <= "1001100";
            when 5 => d <= "0100100";
            when 6 => d <= "0100000";
            when 7 => d <= "1110000";
            when 8 => d <= "0000000";
            when 9 => d <= "0000100";
            when 10 => d <= "0001000"; -- a
            when 11 => d <= "0110001"; -- b
            when 12 => d <= "1110010"; -- c
            when 13 => d <= "1000010"; -- d
            when 14 => d <= "0110000"; -- e
            when 15 => d <= "0111000"; -- f
            when others => d <= "1111110"; -- Default
        end case;
    end process;

end Behavioral;
