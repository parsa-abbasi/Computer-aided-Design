library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity counter12bit_tb is
end counter12bit_tb;

architecture TB_ARCHITECTURE of counter12bit_tb is
	-- Component declaration of the tested unit
	component counter12bit
	port(
		CountEn : in STD_LOGIC;
		Clk : in STD_LOGIC;
		Output : out STD_LOGIC_VECTOR(11 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal CountEn : STD_LOGIC;
	signal Clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Output : STD_LOGIC_VECTOR(11 downto 0);
	   constant clk_period : time := 20 ns;
	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : counter12bit
		port map (
			CountEn => CountEn,
			Clk => Clk,
			Output => Output
		);

	clk_process :process
	begin
		Clk <= '0';
		wait for clk_period/2;
		Clk <= '1';
		wait for clk_period/2;
	end process;
	
	controller_process :process
	begin
		CountEn <= '0';
		wait for 10 ns;
		CountEn <= '1';
		wait for 500 ns;
		CountEn <= '0';
		wait for 60 ns;
		CountEn <= '1';
		wait for 600 ns;
		wait;
	end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_counter12bit of counter12bit_tb is
	for TB_ARCHITECTURE
		for UUT : counter12bit
			use entity work.counter12bit(counter12bit);
		end for;
	end for;
end TESTBENCH_FOR_counter12bit;

