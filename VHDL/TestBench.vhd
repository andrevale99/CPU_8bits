--COMANDO no terminal para compilar e visuzalizar no GTKWAVE
--ghdl -a Componentes/*.vhd  && ghdl -a TESTBENCH.vhd && ghdl -e tb && ghdl -r tb --vcd=wave.simulation --stop-time=10sec && gtkwave wave.simu

library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;
    
architecture bench of tb is

    component SHIFTLEFT8 is
        port (S : in std_logic_vector(2 downto 0);
                I : in std_logic_vector(7 downto 0);
                Y : out std_logic_vector(7 downto 0));
    end component;
    
    
        signal clk: bit := '0'; --CLOCK
        signal A : std_logic_vector(7 downto 0);
        signal sel : std_logic_vector(2 downto 0);

        --EXEMPLO de como criar os componentes para visualização no GTKWAVE
        --for MUX8 : MUX8B use entity work.MUX8B;
        for SLF : SHIFTLEFT8 use entity work.SHIFTLEFT8;
 
        begin
        --EXEMPLO de como criar os componentes para visualização no GTKWAVE
        --MUX8 : MUX8B port map (i=>a, s=>S);
        SLF : SHIFTLEFT8 port map(S=>sel, I=>A);

        
        process
        begin

            A <= "00000001";
            sel <= "000";
            wait for 1 sec;

            sel <= "001";
            wait for 1 sec;

            sel <= "010";
            wait for 1 sec;

            sel <= "011";
            wait for 1 sec;

            sel <= "100";
            wait for 1 sec;

            sel <= "101";
            wait for 1 sec;
        wait;
        end process;
end bench;