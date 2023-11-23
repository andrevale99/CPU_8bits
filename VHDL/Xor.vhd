--==============================================================================================
--				OPERACAO XOR
--==============================================================================================
library ieee;
use ieee.std_logic_1164.all;

entity XOR8 is
    port (A, B : in std_logic_vector(7 downto 0);
            S : out std_logic_vector(7 downto 0));
end XOR8;

architecture ckt of XOR8 is

begin

    S <= A xor B;

end ckt;