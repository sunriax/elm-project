--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
--Date        : Tue May  2 08:44:44 2017
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
  attribute CORE_GENERATION_INFO of clock_bd : entity is "clock_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=clock_bd,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of clock_bd : entity is "clock_bd.hwdef";
end clock_bd;

architecture STRUCTURE of clock_bd is
  component clock_bd_clk_wiz_0_0 is
  port (
    reset : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    sysCLK : out STD_LOGIC;
    power_down : in STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component clock_bd_clk_wiz_0_0;
  component clock_bd_util_vector_logic_0_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component clock_bd_util_vector_logic_0_0;
  signal RESET_1 : STD_LOGIC;
  signal clk_in1_1 : STD_LOGIC;
  signal clk_wiz_0_locked : STD_LOGIC;
  signal clk_wiz_0_sysCLK : STD_LOGIC;
  signal notEN_1 : STD_LOGIC;
  signal util_vector_logic_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  RESET_1 <= RESET;
  clk_in1_1 <= CLK;
  notEN_1 <= notEN;
  sysCLK <= clk_wiz_0_sysCLK;
  sysLOCK <= clk_wiz_0_locked;
clk_wiz_0: component clock_bd_clk_wiz_0_0
     port map (
      clk_in1 => clk_in1_1,
      locked => clk_wiz_0_locked,
      power_down => util_vector_logic_0_Res(0),
      reset => RESET_1,
      sysCLK => clk_wiz_0_sysCLK
    );
util_vector_logic_0: component clock_bd_util_vector_logic_0_0
     port map (
      Op1(0) => notEN_1,
      Res(0) => util_vector_logic_0_Res(0)
    );
end STRUCTURE;
