--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
--Date        : Tue May  2 10:00:49 2017
--Host        : LAPTOP running 64-bit major release  (build 9200)
--Command     : generate_target analog_bd_wrapper.bd
--Design      : analog_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity analog_bd_wrapper is
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
end analog_bd_wrapper;

architecture STRUCTURE of analog_bd_wrapper is
  component analog_bd is
  port (
    CLK : in STD_LOGIC;
    RESET : in STD_LOGIC;
    do_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drdy_out : out STD_LOGIC;
    di_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dwe_in : in STD_LOGIC;
    den_in : in STD_LOGIC;
    daddr_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    usertemp_alarm_out : out STD_LOGIC;
    vccint_alarm_out : out STD_LOGIC;
    vccaux_alarm_out : out STD_LOGIC;
    overtemp_alarm_out : out STD_LOGIC;
    channel_out : out STD_LOGIC_VECTOR ( 4 downto 0 );
    eoc_out : out STD_LOGIC;
    vccbram_alarm_out : out STD_LOGIC;
    alarm_out : out STD_LOGIC;
    eos_out : out STD_LOGIC;
    busy_out : out STD_LOGIC;
    vauxn7 : in STD_LOGIC;
    vauxp7 : in STD_LOGIC;
    vauxn14 : in STD_LOGIC;
    vauxp14 : in STD_LOGIC;
    vauxn15 : in STD_LOGIC;
    vauxp15 : in STD_LOGIC;
    vauxn6 : in STD_LOGIC;
    vauxp6 : in STD_LOGIC
  );
  end component analog_bd;
begin
analog_bd_i: component analog_bd
     port map (
      CLK => CLK,
      RESET => RESET,
      alarm_out => alarm_out,
      busy_out => busy_out,
      channel_out(4 downto 0) => channel_out(4 downto 0),
      daddr_in(6 downto 0) => daddr_in(6 downto 0),
      den_in => den_in,
      di_in(15 downto 0) => di_in(15 downto 0),
      do_out(15 downto 0) => do_out(15 downto 0),
      drdy_out => drdy_out,
      dwe_in => dwe_in,
      eoc_out => eoc_out,
      eos_out => eos_out,
      overtemp_alarm_out => overtemp_alarm_out,
      usertemp_alarm_out => usertemp_alarm_out,
      vauxn14 => vauxn14,
      vauxn15 => vauxn15,
      vauxn6 => vauxn6,
      vauxn7 => vauxn7,
      vauxp14 => vauxp14,
      vauxp15 => vauxp15,
      vauxp6 => vauxp6,
      vauxp7 => vauxp7,
      vccaux_alarm_out => vccaux_alarm_out,
      vccbram_alarm_out => vccbram_alarm_out,
      vccint_alarm_out => vccint_alarm_out
    );
end STRUCTURE;
