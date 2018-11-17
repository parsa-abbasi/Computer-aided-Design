library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

	-- Add your library and packages declaration here ...

entity sevensegdecoder_tb is
end sevensegdecoder_tb;

architecture TB_ARCHITECTURE of sevensegdecoder_tb is
	-- Component declaration of the tested unit
	component sevensegdecoder
	port(
		In7seg : in STD_LOGIC_VECTOR(0 to 3);
		Out7seg : out STD_LOGIC_VECTOR(0 to 6) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal In7seg : STD_LOGIC_VECTOR(0 to 3);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Out7seg : STD_LOGIC_VECTOR(0 to 6);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : sevensegdecoder
		port map (
			In7seg => In7seg,
			Out7seg => Out7seg
		);

	-- Add your stimulus here ...
	TEST: process
	begin
		for index in 0 to 15 loop
      		In7seg <= std_logic_vector(to_unsigned(index, In7seg'length));
      	wait for 10 ns;
    	end loop;
		wait;
	end process TEST;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_sevensegdecoder of sevensegdecoder_tb is
	for TB_ARCHITECTURE
		for UUT : sevensegdecoder
			use entity work.sevensegdecoder(sevensegdecoder);
		end for;
	end for;
end TESTBENCH_FOR_sevensegdecoder;

