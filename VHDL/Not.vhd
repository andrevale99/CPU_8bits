--==============================================================================================
--				OPERACAO AND
--==============================================================================================
library ieee;
use ieee.std_logic_1164.all;

entity NOT8 is
    port (A : in std_logic_vector(7 downto 0);
            S : out std_logic_vector(7 downto 0));
end NOT8;

architecture ckt of NOT8 is

begin

    S <= not A;

end ckt;