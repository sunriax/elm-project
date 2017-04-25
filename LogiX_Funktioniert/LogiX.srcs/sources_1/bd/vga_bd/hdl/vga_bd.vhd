--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
--Date        : Mon Apr 24 13:34:52 2017
--Host        : LAPTOP running 64-bit major release  (build 9200)
--Command     : generate_target vga_bd.bd
--Design      : vga_bd
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity vga_bd is
  port (
    CLK : in STD_LOGIC;
    CLK1024x768 : out STD_LOGIC;
    CLK1280x1024 : out STD_LOGIC;
    CLK640x480 : out STD_LOGIC;
    CLK800x600 : out STD_LOGIC;
    RESET : in STD_LOGIC;
    notEN : in STD_LOGIC;
    vgaLOCK : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of vga_bd : entity is "vga_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=vga_bd,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of vga_bd : entity is "vga_bd.hwdef";
end vga_bd;

architecture STRUCTURE of vga_bd is
  component vga_bd_clk_wiz_0_0 is
  port (
    resetn : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    CLK1280x1024 : out STD_LOGIC;
    CLK1024x768 : out STD_LOGIC;
    CLK800x600 : out STD_LOGIC;
    CLK640x480 : out STD_LOGIC;
    power_down : in STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component vga_bd_clk_wiz_0_0;
  signal clk_in1_1 : STD_LOGIC;
  signal clk_wiz_0_CLK1024x768 : STD_LOGIC;
  signal clk_wiz_0_CLK1280x1024 : STD_LOGIC;
  signal clk_wiz_0_CLK640x480 : STD_LOGIC;
  signal clk_wiz_0_CLK800x600 : STD_LOGIC;
  signal clk_wiz_0_locked : STD_LOGIC;
  signal power_down_1 : STD_LOGIC;
  signal resetn_1 : STD_LOGIC;
begin
  CLK1024x768 <= clk_wiz_0_CLK1024x768;
  CLK1280x1024 <= clk_wiz_0_CLK1280x1024;
  CLK640x480 <= clk_wiz_0_CLK640x480;
  CLK800x600 <= clk_wiz_0_CLK800x600;
  clk_in1_1 <= CLK;
  power_down_1 <= notEN;
  resetn_1 <= RESET;
  vgaLOCK <= clk_wiz_0_locked;
clk_wiz_0: component vga_bd_clk_wiz_0_0
     port map (
      CLK1024x768 => clk_wiz_0_CLK1024x768,
      CLK1280x1024 => clk_wiz_0_CLK1280x1024,
      CLK640x480 => clk_wiz_0_CLK640x480,
      CLK800x600 => clk_wiz_0_CLK800x600,
      clk_in1 => clk_in1_1,
      locked => clk_wiz_0_locked,
      power_down => power_down_1,
      resetn => resetn_1
    );
end STRUCTURE;
