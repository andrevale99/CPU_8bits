--==============================================================================================
--				OPERACAO OR
--==============================================================================================
library ieee;
use ieee.std_logic_1164.all;

entity OR8 is
    port (A, B : in std_logic_vector(7 downto 0);
            S : out std_logic_vector(7 downto 0));
end OR8;

architecture ckt of OR8 is

begin

    S <= A or B;

end ckt;