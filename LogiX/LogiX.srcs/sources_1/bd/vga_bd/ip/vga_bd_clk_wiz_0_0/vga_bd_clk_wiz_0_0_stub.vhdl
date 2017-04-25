-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
-- Date        : Mon Apr 24 10:28:36 2017
-- Host        : LAPTOP running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.srcs/sources_1/bd/vga_bd/ip/vga_bd_clk_wiz_0_0/vga_bd_clk_wiz_0_0_stub.vhdl
-- Design      : vga_bd_clk_wiz_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vga_bd_clk_wiz_0_0 is
  Port ( 
    CLK1280x1024 : out STD_LOGIC;
    CLK1024x768 : out STD_LOGIC;
    CLK800x600 : out STD_LOGIC;
    CLK640x480 : out STD_LOGIC;
    resetn : in STD_LOGIC;
    power_down : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end vga_bd_clk_wiz_0_0;

architecture stub of vga_bd_clk_wiz_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK1280x1024,CLK1024x768,CLK800x600,CLK640x480,resetn,power_down,locked,clk_in1";
begin
end;
