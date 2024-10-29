
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity a is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           s1 : out  STD_LOGIC;
           s2 : out  STD_LOGIC);
end a;

architecture Behavioral of a is

begin

s1 <= ( a and b ) or c;

s2 <= ( a and b ) xor not(c);

end Behavioral;

