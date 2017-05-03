vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm
vlib msim/util_vector_logic_v2_0_1

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm
vmap util_vector_logic_v2_0_1 msim/util_vector_logic_v2_0_1

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../../LogiX.srcs/sources_1/bd/clock_bd/ipshared/65a4" "+incdir+../../../../LogiX.srcs/sources_1/bd/clock_bd/ipshared/65a4" \
"C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../LogiX.srcs/sources_1/bd/clock_bd/ipshared/65a4" "+incdir+../../../../LogiX.srcs/sources_1/bd/clock_bd/ipshared/65a4" \
"../../../bd/clock_bd/ip/clock_bd_clk_wiz_0_0/clock_bd_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/clock_bd/ip/clock_bd_clk_wiz_0_0/clock_bd_clk_wiz_0_0.v" \

vlog -work util_vector_logic_v2_0_1 -64 -incr "+incdir+../../../../LogiX.srcs/sources_1/bd/clock_bd/ipshared/65a4" "+incdir+../../../../LogiX.srcs/sources_1/bd/clock_bd/ipshared/65a4" \
"../../../../LogiX.srcs/sources_1/bd/clock_bd/ipshared/6d4d/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../LogiX.srcs/sources_1/bd/clock_bd/ipshared/65a4" "+incdir+../../../../LogiX.srcs/sources_1/bd/clock_bd/ipshared/65a4" \
"../../../bd/clock_bd/ip/clock_bd_util_vector_logic_0_0/sim/clock_bd_util_vector_logic_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/clock_bd/hdl/clock_bd.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

