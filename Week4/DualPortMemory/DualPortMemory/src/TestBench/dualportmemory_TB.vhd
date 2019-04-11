library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity dualportmemory_tb is
	-- Generic declarations of the tested unit
		generic(
		Addr_Width : NATURAL := 8;
		Data_Width : NATURAL := 8 );
end dualportmemory_tb;

architecture TB_ARCHITECTURE of dualportmemory_tb is
	-- Component declaration of the tested unit
	component dualportmemory
		generic(
		Addr_Width : NATURAL := 8;
		Data_Width : NATURAL := 8 );
	port(
		Clk : in STD_LOGIC;
		CS1 : in STD_LOGIC;
		CS2 : in STD_LOGIC;
		WE1 : in STD_LOGIC;
		WE2 : in STD_LOGIC;
		Addr1 : in STD_LOGIC_VECTOR(Addr_Width-1 downto 0);
		Addr2 : in STD_LOGIC_VECTOR(Addr_Width-1 downto 0);
		Data1 : inout STD_LOGIC_VECTOR(Data_Width-1 downto 0);
		Data2 : inout STD_LOGIC_VECTOR(Data_Width-1 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Clk : STD_LOGIC;
	signal CS1 : STD_LOGIC;
	signal CS2 : STD_LOGIC;
	signal WE1 : STD_LOGIC;
	signal WE2 : STD_LOGIC;
	signal Addr1 : STD_LOGIC_VECTOR(Addr_Width-1 downto 0);
	signal Addr2 : STD_LOGIC_VECTOR(Addr_Width-1 downto 0);
	signal Data1 : STD_LOGIC_VECTOR(Data_Width-1 downto 0);
	signal Data2 : STD_LOGIC_VECTOR(Data_Width-1 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	constant clk_period : time := 20 ns;
	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : dualportmemory
		generic map (
			Addr_Width => Addr_Width,
			Data_Width => Data_Width
		)

		port map (
			Clk => Clk,
			CS1 => CS1,
			CS2 => CS2,
			WE1 => WE1,
			WE2 => WE2,
			Addr1 => Addr1,
			Addr2 => Addr2,
			Data1 => Data1,
			Data2 => Data2
		);

	-- Add your stimulus here ...
	clk_process :process
	begin
		Clk <= '1';
        wait for clk_period/2;
        Clk <= '0';
        wait for clk_period/2;
	end process;
	
	test_process: process
	begin
		-- Write from Port2
		CS1 <= '0';
		WE1 <= '0';
		CS2 <= '1';
		WE2 <= '1';
		Addr2 <= "00000010";
		Data2 <= "00001100";
		wait for 40 ns;
		-- Read to Port1
		CS2 <= '0';
		CS1 <= '1';
		WE1 <= '0';
		Addr1 <= "00000010";
		wait for 40 ns;
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_dualportmemory of dualportmemory_tb is
	for TB_ARCHITECTURE
		for UUT : dualportmemory
			use entity work.dualportmemory(dualportmemory);
		end for;
	end for;
end TESTBENCH_FOR_dualportmemory;

