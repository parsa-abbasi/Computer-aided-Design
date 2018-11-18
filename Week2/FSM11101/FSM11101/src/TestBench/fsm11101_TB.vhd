library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity fsm11101_tb is
end fsm11101_tb;

architecture TB_ARCHITECTURE of fsm11101_tb is
	-- Component declaration of the tested unit
	component fsm11101
	port(
		Input : in STD_LOGIC;
		Clk : in STD_LOGIC;
		Rst : in STD_LOGIC;
		Output : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Input : STD_LOGIC;
	signal Clk : STD_LOGIC;
	signal Rst : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Output : STD_LOGIC;
	   
	constant clk_period : time := 20 ns;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : fsm11101
		port map (
			Input => Input,
			Clk => Clk,
			Rst => Rst,
			Output => Output
		);

	-- Add your stimulus here ...
	clk_process :process
	begin
		Clk <= '0';
		wait for clk_period/2;
		Clk <= '1';
		wait for clk_period/2;
	end process;
	
	process is
	begin
		Rst <= '1'; wait for 20 ns;
		Rst <= '0';
		Input <= '0'; wait for 20 ns;
		Input <= '1'; wait for 20 ns;
		Input <= '1'; wait for 20 ns;
		Input <= '1'; wait for 20 ns;
		Input <= '0'; wait for 20 ns;
		Input <= '1'; wait for 20ns;
		Input <= '0'; wait for 20 ns;
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_fsm11101 of fsm11101_tb is
	for TB_ARCHITECTURE
		for UUT : fsm11101
			use entity work.fsm11101(fsm11101);
		end for;
	end for;
end TESTBENCH_FOR_fsm11101;

