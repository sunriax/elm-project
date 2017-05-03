vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib  -sv2k12 \
"C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/analog_bd/ip/analog_bd_xadc_wiz_0_0/analog_bd_xadc_wiz_0_0.vhd" \
"../../../bd/analog_bd/hdl/analog_bd.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

