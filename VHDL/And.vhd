--==============================================================================================
--				OPERACAO AND
--==============================================================================================
library ieee;
use ieee.std_logic_1164.all;

entity AND8 is
    port (A, B : in std_logic_vector(7 downto 0);
            S : out std_logic_vector(7 downto 0));
end AND8;

architecture ckt of AND8 is

begin

    S <= A and B;

end ckt;