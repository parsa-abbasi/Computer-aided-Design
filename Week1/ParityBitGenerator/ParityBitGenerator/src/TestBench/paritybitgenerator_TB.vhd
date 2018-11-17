library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
	-- Add your library and packages declaration here ...

entity paritybitgenerator_tb is
end paritybitgenerator_tb;

architecture TB_ARCHITECTURE of paritybitgenerator_tb is
	-- Component declaration of the tested unit
	component paritybitgenerator
	port(
		Input : in STD_LOGIC_VECTOR(0 to 6);
		Parity_odd : out STD_LOGIC;
		Parity_even : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Input : STD_LOGIC_VECTOR(0 to 6);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Parity_odd : STD_LOGIC;
	signal Parity_even : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : paritybitgenerator
		port map (
			Input => Input,
			Parity_odd => Parity_odd,
			Parity_even => Parity_even
		);

	-- Add your stimulus here ...
	TEST: process
	begin
		for index in 0 to 127 loop
      		Input <= std_logic_vector(to_unsigned(index, Input'length));
      	wait for 10 ns;
    	end loop;
		wait;
	end process TEST;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_paritybitgenerator of paritybitgenerator_tb is
	for TB_ARCHITECTURE
		for UUT : paritybitgenerator
			use entity work.paritybitgenerator(paritybitgenerator);
		end for;
	end for;
end TESTBENCH_FOR_paritybitgenerator;

