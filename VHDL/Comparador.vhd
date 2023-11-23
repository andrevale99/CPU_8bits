--================================================================
--  COMPARADOR DE 8 BITS
--================================================================
library ieee;
use ieee.std_logic_1164.all;

entity COMP8 is
    port( A : in std_logic_vector(7 downto 0);
          B : in std_logic_vector(7 downto 0);
          Result : out std_logic);
end COMP8;

architecture ckt of COMP8 is

    begin
        Result <= (A(0) xnor B(0)) and (A(1) xnor B(1)) and 
                  (A(2) xnor B(2)) and (A(3) xnor B(3))
                  (A(4) xnor B(4)) and (A(5) xnor B(5)) and 
                  (A(6) xnor B(6)) and (A(7) xnor B(7));
end ckt;