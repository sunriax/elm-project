
################################################################
# This is a generated script based on design: vga_bd
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2017.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source vga_bd_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
}


# CHANGE DESIGN NAME HERE
set design_name vga_bd

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set CLK [ create_bd_port -dir I -type clk CLK ]
  set CLK1024x768 [ create_bd_port -dir O -type clk CLK1024x768 ]
  set CLK1280x1024 [ create_bd_port -dir O -type clk CLK1280x1024 ]
  set CLK640x480 [ create_bd_port -dir O -type clk CLK640x480 ]
  set CLK800x600 [ create_bd_port -dir O -type clk CLK800x600 ]
  set RESET [ create_bd_port -dir I -type rst RESET ]
  set notEN [ create_bd_port -dir I notEN ]
  set vgaLOCK [ create_bd_port -dir O vgaLOCK ]

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.4 clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {256.807} \
CONFIG.CLKOUT1_PHASE_ERROR {408.086} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {108.000} \
CONFIG.CLKOUT2_JITTER {275.099} \
CONFIG.CLKOUT2_PHASE_ERROR {408.086} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {65.000} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.CLKOUT3_JITTER {293.873} \
CONFIG.CLKOUT3_PHASE_ERROR {408.086} \
CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {40.000} \
CONFIG.CLKOUT3_USED {true} \
CONFIG.CLKOUT4_JITTER {313.553} \
CONFIG.CLKOUT4_PHASE_ERROR {408.086} \
CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {25.175} \
CONFIG.CLKOUT4_USED {true} \
CONFIG.CLKOUT5_JITTER {193.459} \
CONFIG.CLKOUT5_PHASE_ERROR {306.323} \
CONFIG.CLKOUT5_REQUESTED_OUT_FREQ {100.000} \
CONFIG.CLKOUT5_USED {false} \
CONFIG.CLK_OUT1_PORT {CLK1280x1024} \
CONFIG.CLK_OUT2_PORT {CLK1024x768} \
CONFIG.CLK_OUT3_PORT {CLK800x600} \
CONFIG.CLK_OUT4_PORT {CLK640x480} \
CONFIG.MMCM_CLKFBOUT_MULT_F {62.375} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {9.625} \
CONFIG.MMCM_CLKOUT1_DIVIDE {16} \
CONFIG.MMCM_CLKOUT2_DIVIDE {26} \
CONFIG.MMCM_CLKOUT3_DIVIDE {41} \
CONFIG.MMCM_CLKOUT4_DIVIDE {1} \
CONFIG.MMCM_DIVCLK_DIVIDE {6} \
CONFIG.NUM_OUT_CLKS {4} \
CONFIG.RESET_PORT {resetn} \
CONFIG.RESET_TYPE {ACTIVE_LOW} \
CONFIG.USE_POWER_DOWN {true} \
 ] $clk_wiz_0

  # Create port connections
  connect_bd_net -net clk_in1_1 [get_bd_ports CLK] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net clk_wiz_0_CLK1024x768 [get_bd_ports CLK1024x768] [get_bd_pins clk_wiz_0/CLK1024x768]
  connect_bd_net -net clk_wiz_0_CLK1280x1024 [get_bd_ports CLK1280x1024] [get_bd_pins clk_wiz_0/CLK1280x1024]
  connect_bd_net -net clk_wiz_0_CLK640x480 [get_bd_ports CLK640x480] [get_bd_pins clk_wiz_0/CLK640x480]
  connect_bd_net -net clk_wiz_0_CLK800x600 [get_bd_ports CLK800x600] [get_bd_pins clk_wiz_0/CLK800x600]
  connect_bd_net -net clk_wiz_0_locked [get_bd_ports vgaLOCK] [get_bd_pins clk_wiz_0/locked]
  connect_bd_net -net power_down_1 [get_bd_ports notEN] [get_bd_pins clk_wiz_0/power_down]
  connect_bd_net -net resetn_1 [get_bd_ports RESET] [get_bd_pins clk_wiz_0/resetn]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


