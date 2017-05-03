--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
--Date        : Tue May  2 08:44:44 2017
--Host        : LAPTOP running 64-bit major release  (build 9200)
--Command     : generate_target clock_bd_wrapper.bd
--Design      : clock_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clock_bd_wrapper is
  port (
    CLK : in STD_LOGIC;
    RESET : in STD_LOGIC;
    notEN : in STD_LOGIC;
    sysCLK : out STD_LOGIC;
    sysLOCK : out STD_LOGIC
  );
end clock_bd_wrapper;

architecture STRUCTURE of clock_bd_wrapper is
  component clock_bd is
  port (
    CLK : in STD_LOGIC;
    sysLOCK : out STD_LOGIC;
    sysCLK : out STD_LOGIC;
    notEN : in STD_LOGIC;
    RESET : in STD_LOGIC
  );
  end component clock_bd;
begin
clock_bd_i: component clock_bd
     port map (
      CLK => CLK,
      RESET => RESET,
      notEN => notEN,
      sysCLK => sysCLK,
      sysLOCK => sysLOCK
    );
end STRUCTURE;
