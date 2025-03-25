library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity a is
    Port ( a, b, c, d : in  STD_LOGIC;
           x : inout  STD_LOGIC;
           y : out  STD_LOGIC);
end a;

architecture Behavioral of a is

begin
x <= (a and b) or (d);

y <= x xor c;

end Behavioral;

