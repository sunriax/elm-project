vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../LogiX.srcs/sources_1/bd/clock_bd/ipshared/65a4" "+incdir+../../../../LogiX.srcs/sources_1/bd/clock_bd/ipshared/65a4" \
"C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../LogiX.srcs/sources_1/bd/clock_bd/ipshared/65a4" "+incdir+../../../../LogiX.srcs/sources_1/bd/clock_bd/ipshared/65a4" \
"../../../bd/clock_bd/ip/clock_bd_clk_wiz_0_0/clock_bd_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/clock_bd/ip/clock_bd_clk_wiz_0_0/clock_bd_clk_wiz_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/clock_bd/hdl/clock_bd.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

