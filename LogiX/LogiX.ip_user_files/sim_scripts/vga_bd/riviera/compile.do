vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/util_vector_logic_v2_0_1

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap util_vector_logic_v2_0_1 riviera/util_vector_logic_v2_0_1

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../LogiX.srcs/sources_1/bd/vga_bd/ipshared/65a4" "+incdir+../../../../LogiX.srcs/sources_1/bd/vga_bd/ipshared/65a4" \
"C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../LogiX.srcs/sources_1/bd/vga_bd/ipshared/65a4" "+incdir+../../../../LogiX.srcs/sources_1/bd/vga_bd/ipshared/65a4" \
"../../../bd/vga_bd/ip/vga_bd_clk_wiz_0_0/vga_bd_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/vga_bd/ip/vga_bd_clk_wiz_0_0/vga_bd_clk_wiz_0_0.v" \

vlog -work util_vector_logic_v2_0_1  -v2k5 "+incdir+../../../../LogiX.srcs/sources_1/bd/vga_bd/ipshared/65a4" "+incdir+../../../../LogiX.srcs/sources_1/bd/vga_bd/ipshared/65a4" \
"../../../../LogiX.srcs/sources_1/bd/vga_bd/ipshared/6d4d/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../LogiX.srcs/sources_1/bd/vga_bd/ipshared/65a4" "+incdir+../../../../LogiX.srcs/sources_1/bd/vga_bd/ipshared/65a4" \
"../../../bd/vga_bd/ip/vga_bd_util_vector_logic_0_0/sim/vga_bd_util_vector_logic_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/vga_bd/hdl/vga_bd.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

