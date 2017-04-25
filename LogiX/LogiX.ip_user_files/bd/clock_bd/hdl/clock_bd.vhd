--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
--Date        : Sat Apr 22 11:47:26 2017
--Host        : LAPTOP running 64-bit major release  (build 9200)
--Command     : generate_target clock_bd.bd
--Design      : clock_bd
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clock_bd is
  port (
    CLK : in STD_LOGIC;
    RESET : in STD_LOGIC;
    notEN : in STD_LOGIC;
    sysCLK : out STD_LOGIC;
    sysLOCK : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of clock_bd : entity is "clock_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=clock_bd,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of clock_bd : entity is "clock_bd.hwdef";
end clock_bd;

architecture STRUCTURE of clock_bd is
  component clock_bd_clk_wiz_0_0 is
  port (
    resetn : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    locked : out STD_LOGIC;
    sysCLK : out STD_LOGIC;
    power_down : in STD_LOGIC
  );
  end component clock_bd_clk_wiz_0_0;
  signal clk_in1_1 : STD_LOGIC;
  signal clk_wiz_0_locked : STD_LOGIC;
  signal clk_wiz_0_sysCLK : STD_LOGIC;
  signal power_down_1 : STD_LOGIC;
  signal resetn_1 : STD_LOGIC;
begin
  clk_in1_1 <= CLK;
  power_down_1 <= notEN;
  resetn_1 <= RESET;
  sysCLK <= clk_wiz_0_sysCLK;
  sysLOCK <= clk_wiz_0_locked;
clk_wiz_0: component clock_bd_clk_wiz_0_0
     port map (
      clk_in1 => clk_in1_1,
      locked => clk_wiz_0_locked,
      power_down => power_down_1,
      resetn => resetn_1,
      sysCLK => clk_wiz_0_sysCLK
    );
end STRUCTURE;
