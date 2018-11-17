-------------------------------------------------------------------------------
--
-- Title       : SevenSegDecoder
-- Design      : SevenSegDecoder
-- Author      : Parsa Abbasi 
-- Company     : University of Guilan 
--
-------------------------------------------------------------------------------
--
-- File        : SevenSegDecoder.vhd
-- Generated   : Fri Nov  2 16:19:20 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : A 7 segment decoder with 4 inputs and 7 outputs based on a given truth table 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {SevenSegDecoder} architecture {SevenSegDecoder}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SevenSegDecoder is
	 port(
		 In7seg : in STD_LOGIC_VECTOR(0 to 3);
		 Out7seg : out STD_LOGIC_VECTOR(0 to 6)
	     );
end SevenSegDecoder;

--}} End of automatically maintained section

architecture SevenSegDecoder of SevenSegDecoder is
begin
	 with In7seg select
		Out7seg <= "0111111" when "0000",
				"0000110" when "0001",
				"1011011" when "0010",
				"1001111" when "0011",
				"1100110" when "0100",
				"1101101" when "0101",
				"1111101" when "0110",
				"0000111" when "0111",
				"1111111" when "1000",
				"1100111" when "1001",
				"1110111" when "1010",
				"1111100" when "1011",
				"0111001" when "1100",
				"1011110" when "1101",
				"1111001" when "1110",
				"1110001" when "1111",
				"0000000" when others;
end SevenSegDecoder;
