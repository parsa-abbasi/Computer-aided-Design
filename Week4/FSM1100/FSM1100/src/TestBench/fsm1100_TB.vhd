library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity fsm1100_tb is
end fsm1100_tb;

architecture TB_ARCHITECTURE of fsm1100_tb is
	-- Component declaration of the tested unit
	component fsm1100
	port(
		X : in STD_LOGIC;
		Clk : in STD_LOGIC;
		Start : in STD_LOGIC;
		Stop : in STD_LOGIC;
		Output : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal X : STD_LOGIC;
	signal Clk : STD_LOGIC;
	signal Start : STD_LOGIC;
	signal Stop : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Output : STD_LOGIC;
	constant clk_period : time := 20 ns;
	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : fsm1100
		port map (
			X => X,
			Clk => Clk,
			Start => Start,
			Stop => Stop,
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
	
	test_process :process
	begin
		Start <= '0'; wait for 20 ns;
		Start <= '1';
		Stop <= '0';
		X <= '0'; wait for 20 ns;
		X <= '0'; wait for 20 ns;
		X <= '1'; wait for 20 ns;
		X <= '1'; wait for 20 ns;
		X <= '0'; wait for 20 ns;
		X <= '0'; wait for 20 ns;
		X <= '1'; wait for 20 ns;
		Stop <= '1';
		X <= '1'; wait for 20 ns;
		X <= '1'; wait for 20 ns;
		X <= '0'; wait for 20 ns;
		X <= '0'; wait for 20 ns;
		Stop <= '1'; wait for 20 ns;
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_fsm1100 of fsm1100_tb is
	for TB_ARCHITECTURE
		for UUT : fsm1100
			use entity work.fsm1100(fsm1100);
		end for;
	end for;
end TESTBENCH_FOR_fsm1100;

