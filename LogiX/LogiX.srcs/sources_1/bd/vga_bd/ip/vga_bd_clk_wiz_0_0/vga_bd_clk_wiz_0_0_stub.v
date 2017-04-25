// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
// Date        : Mon Apr 24 10:28:36 2017
// Host        : LAPTOP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.srcs/sources_1/bd/vga_bd/ip/vga_bd_clk_wiz_0_0/vga_bd_clk_wiz_0_0_stub.v
// Design      : vga_bd_clk_wiz_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module vga_bd_clk_wiz_0_0(CLK1280x1024, CLK1024x768, CLK800x600, 
  CLK640x480, resetn, power_down, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="CLK1280x1024,CLK1024x768,CLK800x600,CLK640x480,resetn,power_down,locked,clk_in1" */;
  output CLK1280x1024;
  output CLK1024x768;
  output CLK800x600;
  output CLK640x480;
  input resetn;
  input power_down;
  output locked;
  input clk_in1;
endmodule
