-------------------------------------------------------------------------------
--
-- Title       : ParityBitGenerator
-- Design      : ParityBitGenerator
-- Author      : Parsa Abbasi
-- Company     : University of Guilan 
--
-------------------------------------------------------------------------------
--
-- File        : ParityBitGenerator.vhd
-- Generated   : Fri Nov  2 13:32:01 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : A parity bit generator with 7 inputs and 2 outputs 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {ParityBitGenerator} architecture {ParityBitGenerator}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ParityBitGenerator is
	 port(
		 Input : in STD_LOGIC_VECTOR(0 to 6); -- 7bit input
		 Parity_odd : out STD_LOGIC; -- It's '1' if there are odd number of 1s 
		 Parity_even : out STD_LOGIC -- It's '1' if there are even number of 1s
	     );
end ParityBitGenerator;

--}} End of automatically maintained section

architecture ParityBitGenerator of ParityBitGenerator is
	signal parity: std_logic; -- It's work like parity_even
begin
	parity <= Input(0) xor Input(1) xor Input(2) xor Input(3) xor Input(4) xor Input(5) xor Input(6);
	Parity_even <= parity;
	Parity_odd <= not parity;
end ParityBitGenerator;
