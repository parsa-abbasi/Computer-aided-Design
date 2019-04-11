-------------------------------------------------------------------------------
--
-- Title       : DualPortMemory
-- Design      : DualPortMemory
-- Author      : Parsa Abbasi
-- Company     : University of Guilan
--
-------------------------------------------------------------------------------
--
-- File        : DualPortMemory.vhd
-- Generated   : Fri Dec 14 16:18:11 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : A dual port memory with generic size
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {DualPortMemory} architecture {DualPortMemory}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity DualPortMemory is
	generic (Addr_Width: natural:= 8;
			 Data_Width: natural:= 8);
	port(
		 Clk : in STD_LOGIC;
		 CS1, CS2 : in STD_LOGIC;
		 WE1, WE2 : in STD_LOGIC;
		 Addr1, Addr2 : in STD_LOGIC_VECTOR(Addr_Width-1 downto 0);
		 Data1, Data2 : inout STD_LOGIC_VECTOR(Data_Width-1 downto 0)
	     );
end DualPortMemory;

--}} End of automatically maintained section

architecture DualPortMemory of DualPortMemory is
	type RAM_Type is array(2**Addr_Width-1 downto 0) of STD_LOGIC_VECTOR(Data_Width-1 downto 0);
	shared variable RAM: RAM_Type ;
	signal Data1Temp, Data2Temp: STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
begin
	
	-- Write from Port1
	process(clk)
	begin	
		if rising_edge(Clk) then
			if(CS1 = '1' and WE1 = '1') then    
      	          RAM(conv_integer(Addr1)) := Data1; 
     		end if;									
   	 	end if;
	end process;
	
	-- Write from Port2
	process(clk)
	begin	
		if rising_edge(Clk) then
			if(CS2 = '1' and WE2 = '1') then    
      	          RAM(conv_integer(Addr2)) := Data2; 
     		end if;									
   	 	end if;
	end process;
	
	-- Port1 Reader
	process(Addr1, CS1, WE1)
	begin
		if (CS1 = '1' and WE1 = '0') then
			Data1Temp <= RAM(conv_integer(Addr1));
		else
			Data1Temp <= (others=>'0');
		end if;
	end process; 
	
	-- Port2 Reader
	process(Addr2, CS2, WE2)
	begin
		if (CS2 = '1' and WE2 = '0') then
			Data2Temp <= RAM(conv_integer(Addr2));
		else
			Data2Temp <= (others=>'0');
		end if;
	end process;
	
	-- Read from memory and Write on Data1 
	Data1 <= Data1Temp when (CS1 = '1' and WE1 = '0') else (others=>'Z');
		
	-- Read from memory and Write on Data2 
	Data2 <= Data2Temp when (CS2 = '1' and WE2 = '0') else (others=>'Z');
end DualPortMemory;
