-------------------------------------------------------------------------------
--
-- Title       : InertialTransportReject
-- Design      : InertialTransportReject
-- Author      : Parsa Abbasi
-- Company     : University of Guilan
--
-------------------------------------------------------------------------------
--
-- File        : InertialTransportReject.vhd
-- Generated   : Fri Nov 16 22:00:04 2018
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
--{entity {InertialTransportReject} architecture {InertialTransportReject}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity InertialTransportReject is
	 port(
		 qin : in STD_LOGIC;
		 Y1 : out STD_LOGIC;
		 Y2 : out STD_LOGIC;
		 Y3 : out STD_LOGIC;
		 Y4 : out STD_LOGIC;
		 Y5 : out STD_LOGIC
	     );
end InertialTransportReject;

--}} End of automatically maintained section

architecture InertialTransportReject of InertialTransportReject is
begin
	Y1 <= qin;
	Y2 <= qin after 1 ns;
	Y3 <= inertial qin after 1 ns;
	Y4 <= transport qin after 1 ns;
	Y5 <= reject 500 ps inertial qin after 1 ns;
end InertialTransportReject;
