-makelib ies/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "C:/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/clock_bd/ip/clock_bd_clk_wiz_0_0/clock_bd_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/clock_bd/ip/clock_bd_clk_wiz_0_0/clock_bd_clk_wiz_0_0.v" \
-endlib
-makelib ies/util_vector_logic_v2_0_1 \
  "../../../../LogiX.srcs/sources_1/bd/clock_bd/ipshared/6d4d/hdl/util_vector_logic_v2_0_vl_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/clock_bd/ip/clock_bd_util_vector_logic_0_0/sim/clock_bd_util_vector_logic_0_0.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/clock_bd/hdl/clock_bd.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

