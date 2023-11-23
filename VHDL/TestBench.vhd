--COMANDO no terminal para compilar e visuzalizar no GTKWAVE
--ghdl -a Componentes/*.vhd  && ghdl -a TESTBENCH.vhd && ghdl -e tb && ghdl -r tb --vcd=wave.simulation --stop-time=10sec && gtkwave wave.simu

library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;
    
architecture bench of tb is

    component ADD8 is
        port (A, B : in std_logic_vector(7 downto 0);
                Ci : in std_logic;
                Co : out std_logic;
                S : out std_logic_vector(7 downto 0));
    end component;
    
    
        signal clk: bit := '0'; --CLOCK
        signal A : std_logic_vector(7 downto 0);
        signal B : std_logic_vector(7 downto 0);
        signal sel : std_logic;

        --EXEMPLO de como criar os componentes para visualização no GTKWAVE
        --for MUX8 : MUX8B use entity work.MUX8B;
        for ADD : ADD8 use entity work.ADD8;
 
        begin
        --EXEMPLO de como criar os componentes para visualização no GTKWAVE
        --MUX8 : MUX8B port map (i=>a, s=>S);
        ADD : ADD8 port map(A=>A, B=>B, Ci=>sel);

        
        process
        begin

            A <= "11100000";
            B <= "00000111";
            sel <= '1';
            wait for 1 sec;

            sel <= '0';
            wait for 2 sec;
           
        wait;
        end process;
end bench;