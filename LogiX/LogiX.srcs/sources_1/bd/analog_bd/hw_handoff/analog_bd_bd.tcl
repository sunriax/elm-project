
################################################################
# This is a generated script based on design: analog_bd
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
# source analog_bd_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
}


# CHANGE DESIGN NAME HERE
set design_name analog_bd

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
  set CLK [ create_bd_port -dir I CLK ]
  set RESET [ create_bd_port -dir I RESET ]
  set alarm_out [ create_bd_port -dir O alarm_out ]
  set busy_out [ create_bd_port -dir O busy_out ]
  set channel_out [ create_bd_port -dir O -from 4 -to 0 channel_out ]
  set daddr_in [ create_bd_port -dir I -from 6 -to 0 daddr_in ]
  set den_in [ create_bd_port -dir I den_in ]
  set di_in [ create_bd_port -dir I -from 15 -to 0 di_in ]
  set do_out [ create_bd_port -dir O -from 15 -to 0 do_out ]
  set drdy_out [ create_bd_port -dir O drdy_out ]
  set dwe_in [ create_bd_port -dir I dwe_in ]
  set eoc_out [ create_bd_port -dir O eoc_out ]
  set eos_out [ create_bd_port -dir O eos_out ]
  set overtemp_alarm_out [ create_bd_port -dir O overtemp_alarm_out ]
  set usertemp_alarm_out [ create_bd_port -dir O usertemp_alarm_out ]
  set vauxn6 [ create_bd_port -dir I vauxn6 ]
  set vauxn7 [ create_bd_port -dir I vauxn7 ]
  set vauxn14 [ create_bd_port -dir I vauxn14 ]
  set vauxn15 [ create_bd_port -dir I vauxn15 ]
  set vauxp6 [ create_bd_port -dir I vauxp6 ]
  set vauxp7 [ create_bd_port -dir I vauxp7 ]
  set vauxp14 [ create_bd_port -dir I vauxp14 ]
  set vauxp15 [ create_bd_port -dir I vauxp15 ]
  set vccaux_alarm_out [ create_bd_port -dir O vccaux_alarm_out ]
  set vccbram_alarm_out [ create_bd_port -dir O vccbram_alarm_out ]
  set vccint_alarm_out [ create_bd_port -dir O vccint_alarm_out ]

  # Create instance: xadc_wiz_0, and set properties
  set xadc_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xadc_wiz:3.3 xadc_wiz_0 ]
  set_property -dict [ list \
CONFIG.ACQUISITION_TIME_VAUXP4_VAUXN4 {false} \
CONFIG.ADC_OFFSET_AND_GAIN_CALIBRATION {true} \
CONFIG.AVERAGE_ENABLE_VAUXP12_VAUXN12 {false} \
CONFIG.AVERAGE_ENABLE_VAUXP4_VAUXN4 {false} \
CONFIG.AVERAGE_ENABLE_VAUXP5_VAUXN5 {false} \
CONFIG.AVERAGE_ENABLE_VAUXP6_VAUXN6 {false} \
CONFIG.AVERAGE_ENABLE_VAUXP7_VAUXN7 {false} \
CONFIG.CHANNEL_AVERAGING {16} \
CONFIG.CHANNEL_ENABLE_TEMPERATURE {false} \
CONFIG.CHANNEL_ENABLE_VAUXP10_VAUXN10 {false} \
CONFIG.CHANNEL_ENABLE_VAUXP11_VAUXN11 {false} \
CONFIG.CHANNEL_ENABLE_VAUXP12_VAUXN12 {false} \
CONFIG.CHANNEL_ENABLE_VAUXP13_VAUXN13 {false} \
CONFIG.CHANNEL_ENABLE_VAUXP14_VAUXN14 {true} \
CONFIG.CHANNEL_ENABLE_VAUXP15_VAUXN15 {true} \
CONFIG.CHANNEL_ENABLE_VAUXP4_VAUXN4 {false} \
CONFIG.CHANNEL_ENABLE_VAUXP5_VAUXN5 {false} \
CONFIG.CHANNEL_ENABLE_VAUXP6_VAUXN6 {true} \
CONFIG.CHANNEL_ENABLE_VAUXP7_VAUXN7 {true} \
CONFIG.CHANNEL_ENABLE_VAUXP8_VAUXN8 {false} \
CONFIG.CHANNEL_ENABLE_VAUXP9_VAUXN9 {false} \
CONFIG.CHANNEL_ENABLE_VCCAUX {false} \
CONFIG.CHANNEL_ENABLE_VCCINT {false} \
CONFIG.CHANNEL_ENABLE_VP_VN {false} \
CONFIG.ENABLE_CALIBRATION_AVERAGING {true} \
CONFIG.ENABLE_DCLK {true} \
CONFIG.ENABLE_DRP {false} \
CONFIG.ENABLE_RESET {true} \
CONFIG.ENABLE_VBRAM_ALARM {true} \
CONFIG.EXTERNAL_MUX_CHANNEL {VP_VN} \
CONFIG.INTERFACE_SELECTION {ENABLE_DRP} \
CONFIG.OT_ALARM {true} \
CONFIG.POWER_DOWN_ADCB {false} \
CONFIG.SENSOR_OFFSET_AND_GAIN_CALIBRATION {true} \
CONFIG.SENSOR_OFFSET_CALIBRATION {false} \
CONFIG.SEQUENCER_MODE {Continuous} \
CONFIG.SINGLE_CHANNEL_SELECTION {TEMPERATURE} \
CONFIG.TEMPERATURE_ALARM_OT_RESET {60.0} \
CONFIG.TEMPERATURE_ALARM_OT_TRIGGER {100.0} \
CONFIG.TIMING_MODE {Continuous} \
CONFIG.USER_TEMP_ALARM {true} \
CONFIG.VCCAUX_ALARM {true} \
CONFIG.VCCINT_ALARM {true} \
CONFIG.XADC_STARUP_SELECTION {channel_sequencer} \
 ] $xadc_wiz_0

  # Create port connections
  connect_bd_net -net daddr_in_1 [get_bd_ports daddr_in] [get_bd_pins xadc_wiz_0/daddr_in]
  connect_bd_net -net dclk_in_1 [get_bd_ports CLK] [get_bd_pins xadc_wiz_0/dclk_in]
  connect_bd_net -net den_in_1 [get_bd_ports den_in] [get_bd_pins xadc_wiz_0/den_in]
  connect_bd_net -net di_in_1 [get_bd_ports di_in] [get_bd_pins xadc_wiz_0/di_in]
  connect_bd_net -net dwe_in_1 [get_bd_ports dwe_in] [get_bd_pins xadc_wiz_0/dwe_in]
  connect_bd_net -net reset_in_1 [get_bd_ports RESET] [get_bd_pins xadc_wiz_0/reset_in]
  connect_bd_net -net vauxn14_1 [get_bd_ports vauxn14] [get_bd_pins xadc_wiz_0/vauxn14]
  connect_bd_net -net vauxn15_1 [get_bd_ports vauxn15] [get_bd_pins xadc_wiz_0/vauxn15]
  connect_bd_net -net vauxn6_1 [get_bd_ports vauxn6] [get_bd_pins xadc_wiz_0/vauxn6]
  connect_bd_net -net vauxn7_1 [get_bd_ports vauxn7] [get_bd_pins xadc_wiz_0/vauxn7]
  connect_bd_net -net vauxp14_1 [get_bd_ports vauxp14] [get_bd_pins xadc_wiz_0/vauxp14]
  connect_bd_net -net vauxp15_1 [get_bd_ports vauxp15] [get_bd_pins xadc_wiz_0/vauxp15]
  connect_bd_net -net vauxp6_1 [get_bd_ports vauxp6] [get_bd_pins xadc_wiz_0/vauxp6]
  connect_bd_net -net vauxp7_1 [get_bd_ports vauxp7] [get_bd_pins xadc_wiz_0/vauxp7]
  connect_bd_net -net xadc_wiz_0_alarm_out [get_bd_ports alarm_out] [get_bd_pins xadc_wiz_0/alarm_out]
  connect_bd_net -net xadc_wiz_0_busy_out [get_bd_ports busy_out] [get_bd_pins xadc_wiz_0/busy_out]
  connect_bd_net -net xadc_wiz_0_channel_out [get_bd_ports channel_out] [get_bd_pins xadc_wiz_0/channel_out]
  connect_bd_net -net xadc_wiz_0_do_out [get_bd_ports do_out] [get_bd_pins xadc_wiz_0/do_out]
  connect_bd_net -net xadc_wiz_0_drdy_out [get_bd_ports drdy_out] [get_bd_pins xadc_wiz_0/drdy_out]
  connect_bd_net -net xadc_wiz_0_eoc_out [get_bd_ports eoc_out] [get_bd_pins xadc_wiz_0/eoc_out]
  connect_bd_net -net xadc_wiz_0_eos_out [get_bd_ports eos_out] [get_bd_pins xadc_wiz_0/eos_out]
  connect_bd_net -net xadc_wiz_0_ot_out [get_bd_ports overtemp_alarm_out] [get_bd_pins xadc_wiz_0/ot_out]
  connect_bd_net -net xadc_wiz_0_user_temp_alarm_out [get_bd_ports usertemp_alarm_out] [get_bd_pins xadc_wiz_0/user_temp_alarm_out]
  connect_bd_net -net xadc_wiz_0_vbram_alarm_out [get_bd_ports vccbram_alarm_out] [get_bd_pins xadc_wiz_0/vbram_alarm_out]
  connect_bd_net -net xadc_wiz_0_vccaux_alarm_out [get_bd_ports vccaux_alarm_out] [get_bd_pins xadc_wiz_0/vccaux_alarm_out]
  connect_bd_net -net xadc_wiz_0_vccint_alarm_out [get_bd_ports vccint_alarm_out] [get_bd_pins xadc_wiz_0/vccint_alarm_out]

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


