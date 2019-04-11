-------------------------------------------------------------------------------
--
-- Title       : ALU16Bit
-- Design      : ALU16Bit
-- Author      : Parsa Abbasi
-- Company     : University of Guilan
--
-------------------------------------------------------------------------------
--
-- File        : ALU16Bit.vhd
-- Generated   : Fri Nov 16 14:25:58 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Implement a 16bit ALU 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {ALU16Bit} architecture {ALU16Bit}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity ALU16Bit is
	port(
		 InputA, InputB : in STD_LOGIC_VECTOR(15 downto 0);	
		 Command : in STD_LOGIC_VECTOR(2 downto 0);
		 Clk : in STD_LOGIC;
		 ALUEn : in STD_LOGIC;
		 Output : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end ALU16Bit;

--}} End of automatically maintained section

architecture ALU16Bit of ALU16Bit is
	Signal temp : STD_LOGIC_VECTOR(15 downto 0);
begin
	
	process(Clk) is 
	begin	
		if rising_edge(Clk) then
			if ALUEn = '1' then
				Output <= temp;
			end if;
		end if;
	end process;
	
	process(Command, InputA , InputB) is 
	begin
		temp <= (others => '0');
		case Command is 
				when "000" => temp <= std_logic_vector(unsigned(InputA) + unsigned(InputB)); 
				when "001" => temp <= std_logic_vector(unsigned(InputA) - unsigned(InputB)); 
				when "010" => temp <= std_logic_vector(unsigned(InputA) + 1 );
				when "011" => temp <= std_logic_vector(unsigned(not InputA) + 1); 
				when "100" => temp <= InputA and InputB; 
				when "101" => temp <= InputA or InputB; 
				when "110" => temp <= InputA xor InputB;
				when "111" => temp <= std_logic_vector(unsigned(InputA) sll 1);
				when others => temp <= (others => '0');
		end case;
	end process;
	
end ALU16Bit;
