-------------------------------------------------------------------------------
--
-- Title       : PEncoder
-- Design      : PEncoder
-- Author      : Parsa Abbasi
-- Company     : University of Guilan
--
-------------------------------------------------------------------------------
--
-- File        : PEncoder.vhd
-- Generated   : Wed Nov  7 23:47:46 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {PEncoder} architecture {PEncoder}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity PEncoder is
	generic(N : positive := 4);
	port(Input : in std_logic_vector((2**N)-1 downto 0);
		Output : out std_logic_vector(N-1 downto 0));
end PEncoder;

--}} End of automatically maintained section

architecture PEncoder of PEncoder is
begin
	process(Input)
		variable temp : std_logic_vector(N-1 downto 0);
	begin
		temp := (others=>'0');
		for index in 0 to Input'length-1 loop
			if Input(index)='1' then
				temp := std_logic_vector(to_unsigned(index, Output'length));
			end if;
		end loop;
		Output <= temp;
	end process;
end PEncoder;
