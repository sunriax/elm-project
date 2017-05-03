vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm

vlog -work xil_defaultlib -64 -sv \
"C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/analog_bd/ip/analog_bd_xadc_wiz_0_0/analog_bd_xadc_wiz_0_0.vhd" \
"../../../bd/analog_bd/hdl/analog_bd.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

