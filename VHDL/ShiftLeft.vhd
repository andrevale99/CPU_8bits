--========================================================================
-- 	MUX DE 2 BITS
--========================================================================
library ieee;
use ieee.std_logic_1164.all;

entity MUX2B is
	port(s, i0, i1 : in std_logic;
			y : out std_logic);
end MUX2B;

architecture ckt of MUX2B is

	begin

		y <= (i0 and not s) or (i1 and s);

end ckt;

--========================================================================
-- DESLOCADOR DE 1
--========================================================================
library ieee;
use ieee.std_logic_1164.all;

entity SHFTL_1 is
	port(	s : in std_logic;
			i : in std_logic_vector(7 downto 0);
			y : out std_logic_vector(7 downto 0));
end SHFTL_1;

architecture ckt of SHFTL_1 is

	component MUX2B is
		port(s, i0, i1 : in std_logic;
				y : out std_logic);
	end component;

	begin

		Q7_1 : MUX2B port map (s, i(7), i(6), y(7));
		Q6_1 : MUX2B port map (s, i(6), i(5), y(6));
		Q5_1 : MUX2B port map (s, i(5), i(4), y(5));
		Q4_1 : MUX2B port map (s, i(4), i(3), y(4));
		Q3_1 : MUX2B port map (s, i(3), i(2), y(3));
		Q2_1 : MUX2B port map (s, i(2), i(1), y(2));
		Q1_1 : MUX2B port map (s, i(1), i(0), y(1));
		Q0_1 : MUX2B port map (s, i(0), '0', y(0));

		
end ckt;

--========================================================================
-- DESLOCADOR DE 2
--========================================================================
library ieee;
use ieee.std_logic_1164.all;

entity SHFTL_2 is
	port(	s : in std_logic;
			i : in std_logic_vector(7 downto 0);
			y : out std_logic_vector(7 downto 0));
end SHFTL_2;

architecture ckt of SHFTL_2 is

	component MUX2B is
		port(s, i0, i1 : in std_logic;
				y : out std_logic);
	end component;

	begin

		Q7_2 : MUX2B port map (s, i(7), i(5), y(7));
		Q6_2 : MUX2B port map (s, i(6), i(4), y(6));
		Q5_2 : MUX2B port map (s, i(5), i(3), y(5));
		Q4_2 : MUX2B port map (s, i(4), i(2), y(4));
		Q3_2 : MUX2B port map (s, i(3), i(1), y(3));
		Q2_2 : MUX2B port map (s, i(2), i(0), y(2));
		Q1_2 : MUX2B port map (s, i(1), '0', y(1));
		Q0_2 : MUX2B port map (s, i(0), '0', y(0));
		
end ckt;

--========================================================================
-- DESLOCADOR DE 4
--========================================================================
library ieee;
use ieee.std_logic_1164.all;

entity SHFTL_4 is
	port(	s : in std_logic;
			i : in std_logic_vector(7 downto 0);
			y : out std_logic_vector(7 downto 0));
end SHFTL_4;

architecture ckt of SHFTL_4 is

	component MUX2B is
		port(s, i0, i1 : in std_logic;
				y : out std_logic);
	end component;

	begin

		Q7_4 : MUX2B port map (s, i(7), i(3), y(7));
		Q6_4 : MUX2B port map (s, i(6), i(2), y(6));
		Q5_4 : MUX2B port map (s, i(5), i(1), y(5));
		Q4_4 : MUX2B port map (s, i(4), i(0), y(4));
		Q3_4 : MUX2B port map (s, i(3), '0', y(3));
		Q2_4 : MUX2B port map (s, i(2), '0', y(2));
		Q1_4 : MUX2B port map (s, i(1), '0', y(1));
		Q0_4 : MUX2B port map (s, i(0), '0', y(0));
		
end ckt;

--========================================================================
-- DESLOCADOR BARREL
--========================================================================
library ieee;
use ieee.std_logic_1164.all;

entity SHIFTLEFT8 is
	port (S : in std_logic_vector(2 downto 0);
			I : in std_logic_vector(7 downto 0);
			Y : out std_logic_vector(7 downto 0));
end SHIFTLEFT8;

architecture ckt of SHIFTLEFT8 is

	component SHFTL_1 is
		port(	s : in std_logic;
				i : in std_logic_vector(7 downto 0);
				y : out std_logic_vector(7 downto 0));
	end component;

	component SHFTL_2 is
		port(	s : in std_logic;
				i : in std_logic_vector(7 downto 0);
				y : out std_logic_vector(7 downto 0));
	end component;

	component SHFTL_4 is
		port(	s : in std_logic;
				i : in std_logic_vector(7 downto 0);
				y : out std_logic_vector(7 downto 0));
	end component;
	
	signal var_1 : std_logic_vector(7 downto 0);
	signal var_2 : std_logic_vector(7 downto 0);
	signal var_4 : std_logic_vector(7 downto 0);

	begin
		B1 : SHFTL_1 port map (S(0), I, var_1);
		B2 : SHFTL_2 port map (S(1), var_1, var_2);
		B4 : SHFTL_4 port map (S(2), var_2, var_4);

	Y <= var_4;
		
		
end ckt;