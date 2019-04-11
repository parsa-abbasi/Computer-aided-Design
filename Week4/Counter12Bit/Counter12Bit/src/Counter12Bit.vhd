-------------------------------------------------------------------------------
--
-- Title       : Counter12Bit
-- Design      : Counter12Bit
-- Author      : Parsa Abbasi 
-- Company     : University of Guilan 
--
-------------------------------------------------------------------------------
--
-- File        : Counter12Bit.vhd
-- Generated   : Fri Dec 14 14:24:06 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : A 12 bit counter with enable controller and a fixed finish value. 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Counter12Bit} architecture {Counter12Bit}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity Counter12Bit is
	 port(
		 CountEn : in STD_LOGIC;
		 Clk : in STD_LOGIC;
		 Output: out STD_LOGIC_VECTOR(11 downto 0)
	     );
end Counter12Bit;

--}} End of automatically maintained section

architecture Counter12Bit of Counter12Bit is
	signal temporary: STD_LOGIC_VECTOR(11 downto 0);
	constant finish: STD_LOGIC_VECTOR(11 downto 0) := "010000111000";
begin
	process(Clk, CountEn)
	begin
		temporary <= temporary;	-- Default value
		if(CountEn='0') then			-- Check controller
			temporary <= (others => '0');	
		else
			if rising_edge(Clk) then
				if temporary = finish then	-- Check finish value
					temporary <= (others => '0');
				elsif rising_edge(CountEn) then
					temporary <= (others => '0');
				else	-- Update counter value
					temporary <= STD_LOGIC_VECTOR(unsigned(temporary) + 1);
				end if;
			end if;
		end if;
	end process;
	
	Output <= temporary;	-- Update output
end Counter12Bit;
