--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
--Date        : Tue May  2 08:45:01 2017
--Host        : LAPTOP running 64-bit major release  (build 9200)
--Command     : generate_target vga_bd_wrapper.bd
--Design      : vga_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity vga_bd_wrapper is
  port (
    CLK : in STD_LOGIC;
    CLK1024x768 : out STD_LOGIC;
    CLK1280x1024 : out STD_LOGIC;
    CLK800x600 : out STD_LOGIC;
    RESET : in STD_LOGIC;
    notEN : in STD_LOGIC;
    vgaLOCK : out STD_LOGIC
  );
end vga_bd_wrapper;

architecture STRUCTURE of vga_bd_wrapper is
  component vga_bd is
  port (
    CLK : in STD_LOGIC;
    CLK1280x1024 : out STD_LOGIC;
    CLK1024x768 : out STD_LOGIC;
    CLK800x600 : out STD_LOGIC;
    vgaLOCK : out STD_LOGIC;
    RESET : in STD_LOGIC;
    notEN : in STD_LOGIC
  );
  end component vga_bd;
begin
vga_bd_i: component vga_bd
     port map (
      CLK => CLK,
      CLK1024x768 => CLK1024x768,
      CLK1280x1024 => CLK1280x1024,
      CLK800x600 => CLK800x600,
      RESET => RESET,
      notEN => notEN,
      vgaLOCK => vgaLOCK
    );
end STRUCTURE;
