-------------------------------------------------------------------------------
--
-- Title       : FSM11101
-- Design      : FSM11101
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : FSM11101.vhd
-- Generated   : Fri Nov 16 15:26:08 2018
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
--{entity {FSM11101} architecture {FSM11101}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FSM11101 is
	 port(
		 Input : in STD_LOGIC;
		 Clk : in STD_LOGIC;
		 Rst : in STD_LOGIC;
		 Output : out STD_LOGIC
	     );
end FSM11101;

--}} End of automatically maintained section

architecture FSM11101 of FSM11101 is
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
			when S1 =>  if Input = '1' then NS <= S2; elsif Input = '0' then NS <= S0; end if;
			when S2 =>  if Input = '1' then NS <= S3; elsif Input = '0' then NS <= S0; end if;
			when S3 =>  if Input = '1' then NS <= S3; elsif Input = '0' then NS <= S4; end if;
			when S4 =>  if Input = '1' then NS <= S5; elsif Input = '0' then NS <= S0; end if;
			when S5 =>  if Input = '1' then NS <= S2; elsif Input = '0' then NS <= S0; end if;
		end Case;
	end process;
	
end FSM11101;
