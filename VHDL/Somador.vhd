--==============================================================================================
--				LOGICA DO SOMADOR COMPLETO
--==============================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity SomadorCompleto is
    port( A : in std_logic;
          B : in std_logic;
          Cin : in std_logic;
          Soma : out std_logic;
          Cout : out std_logic);
end SomadorCompleto;

architecture ckt of SomadorCompleto is

begin
    Soma <= A xor B xor Cin;
    Cout <= (A and Cin) or (A and B) or (B and Cin);
end ckt;


--==============================================================================================
--				SOMADOR DE 8 BITS
--==============================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity ADD8 is
	port (A, B : in std_logic_vector(7 downto 0);
			Ci : in std_logic;
			Co : out std_logic;
			S : out std_logic_vector(7 downto 0));
end ADD8;

architecture ckt of ADD8 is

	component SomadorCompleto is
        port( A : in std_logic;
              B : in std_logic;
              Cin : in std_logic;
              Soma : out std_logic;
              Cout : out std_logic);
	end component;

	signal Carry : std_logic_vector(7 downto 0);

	begin

		R0 : SomadorCompleto port map (A(0), B(0), Ci, S(0), Carry(0));		
		R1 : SomadorCompleto port map (A(1), B(1), Carry(0), S(1), Carry(1));
		R2 : SomadorCompleto port map (A(2), B(2), Carry(1), S(2), Carry(2));
		R3 : SomadorCompleto port map (A(3), B(3), Carry(2), S(3), Carry(3));
		R4 : SomadorCompleto port map (A(4), B(4), Carry(3), S(4), Carry(4));
		R5 : SomadorCompleto port map (A(5), B(5), Carry(4), S(5), Carry(5));
		R6 : SomadorCompleto port map (A(6), B(6), Carry(5), S(6), Carry(6));
		R7 : SomadorCompleto port map (A(7), B(7), Carry(6), S(7), Carry(7));
		
		Co <= Carry(7);

end ckt;