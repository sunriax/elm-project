--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
--Date        : Tue May  2 10:00:49 2017
--Host        : LAPTOP running 64-bit major release  (build 9200)
--Command     : generate_target analog_bd.bd
--Design      : analog_bd
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity analog_bd is
  port (
    CLK : in STD_LOGIC;
    RESET : in STD_LOGIC;
    alarm_out : out STD_LOGIC;
    busy_out : out STD_LOGIC;
    channel_out : out STD_LOGIC_VECTOR ( 4 downto 0 );
    daddr_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    den_in : in STD_LOGIC;
    di_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    do_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drdy_out : out STD_LOGIC;
    dwe_in : in STD_LOGIC;
    eoc_out : out STD_LOGIC;
    eos_out : out STD_LOGIC;
    overtemp_alarm_out : out STD_LOGIC;
    usertemp_alarm_out : out STD_LOGIC;
    vauxn14 : in STD_LOGIC;
    vauxn15 : in STD_LOGIC;
    vauxn6 : in STD_LOGIC;
    vauxn7 : in STD_LOGIC;
    vauxp14 : in STD_LOGIC;
    vauxp15 : in STD_LOGIC;
    vauxp6 : in STD_LOGIC;
    vauxp7 : in STD_LOGIC;
    vccaux_alarm_out : out STD_LOGIC;
    vccbram_alarm_out : out STD_LOGIC;
    vccint_alarm_out : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of analog_bd : entity is "analog_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=analog_bd,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of analog_bd : entity is "analog_bd.hwdef";
end analog_bd;

architecture STRUCTURE of analog_bd is
  component analog_bd_xadc_wiz_0_0 is
  port (
    di_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    daddr_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    den_in : in STD_LOGIC;
    dwe_in : in STD_LOGIC;
    drdy_out : out STD_LOGIC;
    do_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dclk_in : in STD_LOGIC;
    reset_in : in STD_LOGIC;
    vp_in : in STD_LOGIC;
    vn_in : in STD_LOGIC;
    vauxp6 : in STD_LOGIC;
    vauxn6 : in STD_LOGIC;
    vauxp7 : in STD_LOGIC;
    vauxn7 : in STD_LOGIC;
    vauxp14 : in STD_LOGIC;
    vauxn14 : in STD_LOGIC;
    vauxp15 : in STD_LOGIC;
    vauxn15 : in STD_LOGIC;
    user_temp_alarm_out : out STD_LOGIC;
    vccint_alarm_out : out STD_LOGIC;
    vccaux_alarm_out : out STD_LOGIC;
    ot_out : out STD_LOGIC;
    channel_out : out STD_LOGIC_VECTOR ( 4 downto 0 );
    eoc_out : out STD_LOGIC;
    vbram_alarm_out : out STD_LOGIC;
    alarm_out : out STD_LOGIC;
    eos_out : out STD_LOGIC;
    busy_out : out STD_LOGIC
  );
  end component analog_bd_xadc_wiz_0_0;
  signal daddr_in_1 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal dclk_in_1 : STD_LOGIC;
  signal den_in_1 : STD_LOGIC;
  signal di_in_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal dwe_in_1 : STD_LOGIC;
  signal reset_in_1 : STD_LOGIC;
  signal vauxn14_1 : STD_LOGIC;
  signal vauxn15_1 : STD_LOGIC;
  signal vauxn6_1 : STD_LOGIC;
  signal vauxn7_1 : STD_LOGIC;
  signal vauxp14_1 : STD_LOGIC;
  signal vauxp15_1 : STD_LOGIC;
  signal vauxp6_1 : STD_LOGIC;
  signal vauxp7_1 : STD_LOGIC;
  signal xadc_wiz_0_alarm_out : STD_LOGIC;
  signal xadc_wiz_0_busy_out : STD_LOGIC;
  signal xadc_wiz_0_channel_out : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal xadc_wiz_0_do_out : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xadc_wiz_0_drdy_out : STD_LOGIC;
  signal xadc_wiz_0_eoc_out : STD_LOGIC;
  signal xadc_wiz_0_eos_out : STD_LOGIC;
  signal xadc_wiz_0_ot_out : STD_LOGIC;
  signal xadc_wiz_0_user_temp_alarm_out : STD_LOGIC;
  signal xadc_wiz_0_vbram_alarm_out : STD_LOGIC;
  signal xadc_wiz_0_vccaux_alarm_out : STD_LOGIC;
  signal xadc_wiz_0_vccint_alarm_out : STD_LOGIC;
begin
  alarm_out <= xadc_wiz_0_alarm_out;
  busy_out <= xadc_wiz_0_busy_out;
  channel_out(4 downto 0) <= xadc_wiz_0_channel_out(4 downto 0);
  daddr_in_1(6 downto 0) <= daddr_in(6 downto 0);
  dclk_in_1 <= CLK;
  den_in_1 <= den_in;
  di_in_1(15 downto 0) <= di_in(15 downto 0);
  do_out(15 downto 0) <= xadc_wiz_0_do_out(15 downto 0);
  drdy_out <= xadc_wiz_0_drdy_out;
  dwe_in_1 <= dwe_in;
  eoc_out <= xadc_wiz_0_eoc_out;
  eos_out <= xadc_wiz_0_eos_out;
  overtemp_alarm_out <= xadc_wiz_0_ot_out;
  reset_in_1 <= RESET;
  usertemp_alarm_out <= xadc_wiz_0_user_temp_alarm_out;
  vauxn14_1 <= vauxn14;
  vauxn15_1 <= vauxn15;
  vauxn6_1 <= vauxn6;
  vauxn7_1 <= vauxn7;
  vauxp14_1 <= vauxp14;
  vauxp15_1 <= vauxp15;
  vauxp6_1 <= vauxp6;
  vauxp7_1 <= vauxp7;
  vccaux_alarm_out <= xadc_wiz_0_vccaux_alarm_out;
  vccbram_alarm_out <= xadc_wiz_0_vbram_alarm_out;
  vccint_alarm_out <= xadc_wiz_0_vccint_alarm_out;
xadc_wiz_0: component analog_bd_xadc_wiz_0_0
     port map (
      alarm_out => xadc_wiz_0_alarm_out,
      busy_out => xadc_wiz_0_busy_out,
      channel_out(4 downto 0) => xadc_wiz_0_channel_out(4 downto 0),
      daddr_in(6 downto 0) => daddr_in_1(6 downto 0),
      dclk_in => dclk_in_1,
      den_in => den_in_1,
      di_in(15 downto 0) => di_in_1(15 downto 0),
      do_out(15 downto 0) => xadc_wiz_0_do_out(15 downto 0),
      drdy_out => xadc_wiz_0_drdy_out,
      dwe_in => dwe_in_1,
      eoc_out => xadc_wiz_0_eoc_out,
      eos_out => xadc_wiz_0_eos_out,
      ot_out => xadc_wiz_0_ot_out,
      reset_in => reset_in_1,
      user_temp_alarm_out => xadc_wiz_0_user_temp_alarm_out,
      vauxn14 => vauxn14_1,
      vauxn15 => vauxn15_1,
      vauxn6 => vauxn6_1,
      vauxn7 => vauxn7_1,
      vauxp14 => vauxp14_1,
      vauxp15 => vauxp15_1,
      vauxp6 => vauxp6_1,
      vauxp7 => vauxp7_1,
      vbram_alarm_out => xadc_wiz_0_vbram_alarm_out,
      vccaux_alarm_out => xadc_wiz_0_vccaux_alarm_out,
      vccint_alarm_out => xadc_wiz_0_vccint_alarm_out,
      vn_in => '0',
      vp_in => '0'
    );
end STRUCTURE;
