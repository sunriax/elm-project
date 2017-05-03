-makelib ies/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/analog_bd/ip/analog_bd_xadc_wiz_0_0/analog_bd_xadc_wiz_0_0.vhd" \
  "../../../bd/analog_bd/hdl/analog_bd.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

