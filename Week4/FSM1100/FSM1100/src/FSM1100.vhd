-------------------------------------------------------------------------------
--
-- Title       : FSM1100
-- Design      : FSM1100
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : FSM1100.vhd
-- Generated   : Fri Dec 14 18:51:13 2018
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
--{entity {FSM1100} architecture {FSM1100}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FSM1100 is
	port(
		 X : in STD_LOGIC;
		 Clk : in STD_LOGIC;
		 Start, Stop : in STD_LOGIC;
		 Output : out STD_LOGIC
	     );
end FSM1100;

--}} End of automatically maintained section

architecture FSM1100 of FSM1100 is
	Type FSM is (S0, S1, S2, S3, S4, S5);
	Signal PS : FSM := S0;
	Signal NS : FSM := S0;
begin
	
	process(Clk) is 
	begin
		if rising_edge(Clk) then
			PS <= PS;
			if Stop = '0' then
				PS <= NS;
			end if;
		end if;	
	end process;
	
	process(PS, X, Start) is
	begin
		Case PS is
			when S0 =>  if Start = '1' then NS <= S1; elsif Start = '0' then NS <= S0; end if; -- Wait for start
			when S1 =>  if X = '1' then NS <= S2; elsif X = '0' then NS <= S1; end if; -- First input
			when S2 =>  if X = '1' then NS <= S3; elsif X = '0' then NS <= S1; end if; -- First '1'
			when S3 =>  if X = '1' then NS <= S3; elsif X = '0' then NS <= S4; end if; -- Second '1'
			when S4 =>  if X = '1' then NS <= S2; elsif X = '0' then NS <= S5; end if; -- First '0'
			when S5 =>  if X = '1' then NS <= S2; elsif X = '0' then NS <= S1; end if; -- Second '0'
		end Case;
	end process;
	
	Output <= '1' when (PS = S5) else '0';
end FSM1100;
