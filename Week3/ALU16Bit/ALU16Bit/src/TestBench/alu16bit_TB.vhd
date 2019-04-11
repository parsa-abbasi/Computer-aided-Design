library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity alu16bit_tb is
end alu16bit_tb;

architecture TB_ARCHITECTURE of alu16bit_tb is
	-- Component declaration of the tested unit
	component alu16bit
	port(
		InputA : in STD_LOGIC_VECTOR(15 downto 0);
		InputB : in STD_LOGIC_VECTOR(15 downto 0);
		Command : in STD_LOGIC_VECTOR(2 downto 0);
		Clk : in STD_LOGIC;
		ALUEn : in STD_LOGIC;
		Output : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal InputA : STD_LOGIC_VECTOR(15 downto 0);
	signal InputB : STD_LOGIC_VECTOR(15 downto 0);
	signal Command : STD_LOGIC_VECTOR(2 downto 0);
	signal Clk : STD_LOGIC;
	signal ALUEn : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Output : STD_LOGIC_VECTOR(15 downto 0);
	constant clk_period : time := 20 ns;
	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : alu16bit
		port map (
			InputA => InputA,
			InputB => InputB,
			Command => Command,
			Clk => Clk,
			ALUEn => ALUEn,
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
	
	InputA <= "0000000000001000";
	InputB <= "0000000000000011";
	
	process is
	begin
		ALUEn <= '0';
		Command <= "000";
		wait for 10ns;
		ALUEn <= '1';
		Command <= "000";
		wait for 10ns;
		ALUEn <= '0';
		Command <= "001";
		wait for 10ns;
		ALUEn <= '1';
		Command <= "001";
		wait for 10ns;
		Command <= "010";
		wait for 10ns; 
		Command <= "011";
		wait for 10ns;
		Command <= "100";
		wait for 10ns; 
		Command <= "101";
		wait for 10ns;
		Command <= "110";
		wait for 10ns;
		Command <= "111";
		wait for 10ns;
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu16bit of alu16bit_tb is
	for TB_ARCHITECTURE
		for UUT : alu16bit
			use entity work.alu16bit(alu16bit);
		end for;
	end for;
end TESTBENCH_FOR_alu16bit;

