# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.cache/wt [current_project]
set_property parent.project_path C:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo c:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/local/Documents/GitHub/source/_vhdl/source/display.vhd
  C:/Users/local/Documents/GitHub/source/_vhdl/source/vga.vhd
  C:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.srcs/sources_1/new/master.vhd
}
add_files C:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.srcs/sources_1/bd/vga_bd/vga_bd.bd
set_property used_in_implementation false [get_files -all c:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.srcs/sources_1/bd/vga_bd/ip/vga_bd_clk_wiz_0_0/vga_bd_clk_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.srcs/sources_1/bd/vga_bd/ip/vga_bd_clk_wiz_0_0/vga_bd_clk_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.srcs/sources_1/bd/vga_bd/ip/vga_bd_clk_wiz_0_0/vga_bd_clk_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.srcs/sources_1/bd/vga_bd/vga_bd_ooc.xdc]
set_property is_locked true [get_files C:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.srcs/sources_1/bd/vga_bd/vga_bd.bd]

add_files C:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.srcs/sources_1/bd/clock_bd/clock_bd.bd
set_property used_in_implementation false [get_files -all c:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.srcs/sources_1/bd/clock_bd/ip/clock_bd_clk_wiz_0_0/clock_bd_clk_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.srcs/sources_1/bd/clock_bd/ip/clock_bd_clk_wiz_0_0/clock_bd_clk_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.srcs/sources_1/bd/clock_bd/ip/clock_bd_clk_wiz_0_0/clock_bd_clk_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.srcs/sources_1/bd/clock_bd/clock_bd_ooc.xdc]
set_property is_locked true [get_files C:/Users/local/Documents/GitHub/elm-project/LogiX/LogiX.srcs/sources_1/bd/clock_bd/clock_bd.bd]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/local/Documents/GitHub/source/_vhdl/constraints/basys3_7segment.xdc
set_property used_in_implementation false [get_files C:/Users/local/Documents/GitHub/source/_vhdl/constraints/basys3_7segment.xdc]

read_xdc C:/Users/local/Documents/GitHub/source/_vhdl/constraints/basys3_analog.xdc
set_property used_in_implementation false [get_files C:/Users/local/Documents/GitHub/source/_vhdl/constraints/basys3_analog.xdc]

read_xdc C:/Users/local/Documents/GitHub/source/_vhdl/constraints/basys3_clock.xdc
set_property used_in_implementation false [get_files C:/Users/local/Documents/GitHub/source/_vhdl/constraints/basys3_clock.xdc]

read_xdc C:/Users/local/Documents/GitHub/source/_vhdl/constraints/basys3_flash.xdc
set_property used_in_implementation false [get_files C:/Users/local/Documents/GitHub/source/_vhdl/constraints/basys3_flash.xdc]

read_xdc C:/Users/local/Documents/GitHub/source/_vhdl/constraints/basys3_header.xdc
set_property used_in_implementation false [get_files C:/Users/local/Documents/GitHub/source/_vhdl/constraints/basys3_header.xdc]

read_xdc C:/Users/local/Documents/GitHub/source/_vhdl/constraints/basys3_signal.xdc
set_property used_in_implementation false [get_files C:/Users/local/Documents/GitHub/source/_vhdl/constraints/basys3_signal.xdc]

read_xdc C:/Users/local/Documents/GitHub/source/_vhdl/constraints/basys3_uart.xdc
set_property used_in_implementation false [get_files C:/Users/local/Documents/GitHub/source/_vhdl/constraints/basys3_uart.xdc]

read_xdc C:/Users/local/Documents/GitHub/source/_vhdl/constraints/basys3_vga.xdc
set_property used_in_implementation false [get_files C:/Users/local/Documents/GitHub/source/_vhdl/constraints/basys3_vga.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top master -part xc7a35tcpg236-1


write_checkpoint -force -noxdef master.dcp

catch { report_utilization -file master_utilization_synth.rpt -pb master_utilization_synth.pb }
