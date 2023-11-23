--
-- MUX de 1 bit de selecao com entrada de 8 bits
--

library ieee;
use ieee.std_logic_1164.all;

entity Mux8b_1sel is
    port( In_1 : in std_logic_vector(7 downto 0);
          In_2 : in std_logic_vector(7 downto 0);
          sel : in std_logic;
          OutMux : out std_logic_vector(7 downto 0));
end Mux8b_1sel;

architecture ckt of Mux8b_1sel is

    begin
        with sel select
            OutMux <= In_1 when '0',
                      In_2 when '1',
                      "00000000" when others;
end ckt;