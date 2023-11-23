--==============================================================================================
--				OPERACAO XNOR
--==============================================================================================
library ieee;
use ieee.std_logic_1164.all;

entity XNOR8 is
    port (A, B : in std_logic_vector(7 downto 0);
            S : out std_logic_vector(7 downto 0));
end XNOR8;

architecture ckt of XNOR8 is

begin

    S <= A xnor B;

end ckt;