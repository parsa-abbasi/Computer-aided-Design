-------------------------------------------------------------------------------
--
-- Title       : FSM3
-- Design      : FSM3
-- Author      : Parsa Abbasi
-- Company     : University of Guilan
--
-------------------------------------------------------------------------------
--
-- File        : FSM3.vhd
-- Generated   : Fri Nov 16 21:42:56 2018
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
--{entity {FSM3} architecture {FSM3}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FSM3 is
	port(
		 Input : in STD_LOGIC;
		 Clk : in STD_LOGIC;
		 Rst : in STD_LOGIC;
		 Output : out STD_LOGIC
	     );
end FSM3;

--}} End of automatically maintained section

architecture FSM3 of FSM3 is
	Type FSM is (S0, S1, S2, S3, S4, S5);
	Signal PS : FSM := S0;
	Signal NS : FSM := S0;
begin
	Output <= '1' when (PS = S5) else '0';
	
	process(Clk, Rst) is 
	begin
		if Rst = '1' then 
			PS <= S0;
		elsif rising_edge(Clk) then 
			PS <= NS;
		end if;	
	end process;
	
	process(PS, Input) is
	begin
		Case PS is
			when S0 =>  if Input = '1' then NS <= S1; elsif Input = '0' then NS <= S0; end if;
			when S1 =>  if Input = '1' then NS <= S0; elsif Input = '0' then NS <= S2; end if;
			when S2 =>  if Input = '1' then NS <= S1; elsif Input = '0' then NS <= S3; end if;
			when S3 =>  if Input = '1' then NS <= S4; elsif Input = '0' then NS <= S3; end if;
			when S4 =>  if Input = '1' then NS <= S5; elsif Input = '0' then NS <= S2; end if;
			when S5 =>  if Input = '1' then NS <= S1; elsif Input = '0' then NS <= S0; end if;
		end Case;
	end process;
	
end FSM3;
