-------------------------------------------------------------------------------
--
-- Title       : TwosComplementProblem
-- Design      : TwosComplementProblem
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : TwosComplementProblem.vhd
-- Generated   : Thu Nov  8 00:38:23 2018
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
--{entity {TwosComplementProblem} architecture {TwosComplementProblem}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity TwosComplementProblem is
	generic(N : positive := 8);
	port(Input : in std_logic_vector(N-1 downto 0);
		Output : out std_logic_vector(N-1 downto 0));
end TwosComplementProblem;

--}} End of automatically maintained section

architecture TwosComplementProblem of TwosComplementProblem is
begin
	process(Input)
		variable counter : unsigned(N-1 downto 0);
	begin
		counter := (others=>'0');
		for index in 0 to Input'length-1 loop
			if Input(index)='1' then
				counter := counter + 1;
			end if;
		end loop;
		if counter > (Input'length/2) then
			Output <= std_logic_vector(unsigned(not(Input)) + 1);
		else
			Output <= Input;
		end if;
	end process;
end TwosComplementProblem;
