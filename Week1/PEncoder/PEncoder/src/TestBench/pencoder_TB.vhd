library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity pencoder_tb is
	-- Generic declarations of the tested unit
		generic(
		N : POSITIVE := 4 );
end pencoder_tb;

architecture TB_ARCHITECTURE of pencoder_tb is
	-- Component declaration of the tested unit
	component pencoder
		generic(
		N : POSITIVE := 4 );
	port(
		Input : in STD_LOGIC_VECTOR((2**N)-1 downto 0);
		Output : out STD_LOGIC_VECTOR(N-1 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Input : STD_LOGIC_VECTOR((2**N)-1 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Output : STD_LOGIC_VECTOR(N-1 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : pencoder
		generic map (
			N => N
		)

		port map (
			Input => Input,
			Output => Output
		);

	-- Add your stimulus here ...
	TEST: process
	begin
		for index in 0 to 15 loop
      		Input <= std_logic_vector(to_unsigned(index, Input'length));
      		wait for 10 ns;
    	end loop;
		wait;
	end process TEST;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_pencoder of pencoder_tb is
	for TB_ARCHITECTURE
		for UUT : pencoder
			use entity work.pencoder(pencoder);
		end for;
	end for;
end TESTBENCH_FOR_pencoder;

