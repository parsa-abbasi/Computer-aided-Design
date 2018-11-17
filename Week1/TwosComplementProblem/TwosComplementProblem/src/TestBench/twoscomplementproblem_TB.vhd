library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity twoscomplementproblem_tb is
	-- Generic declarations of the tested unit
		generic(
		N : POSITIVE := 8 );
end twoscomplementproblem_tb;

architecture TB_ARCHITECTURE of twoscomplementproblem_tb is
	-- Component declaration of the tested unit
	component twoscomplementproblem
		generic(
		N : POSITIVE := 8 );
	port(
		Input : in STD_LOGIC_VECTOR(N-1 downto 0);
		Output : out STD_LOGIC_VECTOR(N-1 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Input : STD_LOGIC_VECTOR(N-1 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Output : STD_LOGIC_VECTOR(N-1 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : twoscomplementproblem
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
		for index in 31 to 63 loop
      		Input <= std_logic_vector(to_unsigned(index, Input'length));
      		wait for 10 ns;
    	end loop;
		Input <= "00001111"; wait for 10 ns;
		Input <= "10101010"; wait for 10 ns;
		Input <= "11100000"; wait for 10 ns;
		Input <= "11000000"; wait for 10 ns;
		Input <= "11111000"; wait for 10 ns;
		wait;
	end process TEST;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_twoscomplementproblem of twoscomplementproblem_tb is
	for TB_ARCHITECTURE
		for UUT : twoscomplementproblem
			use entity work.twoscomplementproblem(twoscomplementproblem);
		end for;
	end for;
end TESTBENCH_FOR_twoscomplementproblem;

