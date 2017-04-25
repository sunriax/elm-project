# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "nCHANNEL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "nCLK1024x768" -parent ${Page_0}
  ipgui::add_param $IPINST -name "nCLK1280x1024" -parent ${Page_0}
  ipgui::add_param $IPINST -name "nCLK640x480" -parent ${Page_0}
  ipgui::add_param $IPINST -name "nCLK800x600" -parent ${Page_0}
  ipgui::add_param $IPINST -name "pxDATASIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "pxMAX" -parent ${Page_0}


}

proc update_PARAM_VALUE.nCHANNEL { PARAM_VALUE.nCHANNEL } {
	# Procedure called to update nCHANNEL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.nCHANNEL { PARAM_VALUE.nCHANNEL } {
	# Procedure called to validate nCHANNEL
	return true
}

proc update_PARAM_VALUE.nCLK1024x768 { PARAM_VALUE.nCLK1024x768 } {
	# Procedure called to update nCLK1024x768 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.nCLK1024x768 { PARAM_VALUE.nCLK1024x768 } {
	# Procedure called to validate nCLK1024x768
	return true
}

proc update_PARAM_VALUE.nCLK1280x1024 { PARAM_VALUE.nCLK1280x1024 } {
	# Procedure called to update nCLK1280x1024 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.nCLK1280x1024 { PARAM_VALUE.nCLK1280x1024 } {
	# Procedure called to validate nCLK1280x1024
	return true
}

proc update_PARAM_VALUE.nCLK640x480 { PARAM_VALUE.nCLK640x480 } {
	# Procedure called to update nCLK640x480 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.nCLK640x480 { PARAM_VALUE.nCLK640x480 } {
	# Procedure called to validate nCLK640x480
	return true
}

proc update_PARAM_VALUE.nCLK800x600 { PARAM_VALUE.nCLK800x600 } {
	# Procedure called to update nCLK800x600 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.nCLK800x600 { PARAM_VALUE.nCLK800x600 } {
	# Procedure called to validate nCLK800x600
	return true
}

proc update_PARAM_VALUE.pxDATASIZE { PARAM_VALUE.pxDATASIZE } {
	# Procedure called to update pxDATASIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.pxDATASIZE { PARAM_VALUE.pxDATASIZE } {
	# Procedure called to validate pxDATASIZE
	return true
}

proc update_PARAM_VALUE.pxMAX { PARAM_VALUE.pxMAX } {
	# Procedure called to update pxMAX when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.pxMAX { PARAM_VALUE.pxMAX } {
	# Procedure called to validate pxMAX
	return true
}


proc update_MODELPARAM_VALUE.nCLK1280x1024 { MODELPARAM_VALUE.nCLK1280x1024 PARAM_VALUE.nCLK1280x1024 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.nCLK1280x1024}] ${MODELPARAM_VALUE.nCLK1280x1024}
}

proc update_MODELPARAM_VALUE.nCLK1024x768 { MODELPARAM_VALUE.nCLK1024x768 PARAM_VALUE.nCLK1024x768 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.nCLK1024x768}] ${MODELPARAM_VALUE.nCLK1024x768}
}

proc update_MODELPARAM_VALUE.nCLK800x600 { MODELPARAM_VALUE.nCLK800x600 PARAM_VALUE.nCLK800x600 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.nCLK800x600}] ${MODELPARAM_VALUE.nCLK800x600}
}

proc update_MODELPARAM_VALUE.nCLK640x480 { MODELPARAM_VALUE.nCLK640x480 PARAM_VALUE.nCLK640x480 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.nCLK640x480}] ${MODELPARAM_VALUE.nCLK640x480}
}

proc update_MODELPARAM_VALUE.nCHANNEL { MODELPARAM_VALUE.nCHANNEL PARAM_VALUE.nCHANNEL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.nCHANNEL}] ${MODELPARAM_VALUE.nCHANNEL}
}

proc update_MODELPARAM_VALUE.pxDATASIZE { MODELPARAM_VALUE.pxDATASIZE PARAM_VALUE.pxDATASIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.pxDATASIZE}] ${MODELPARAM_VALUE.pxDATASIZE}
}

proc update_MODELPARAM_VALUE.pxMAX { MODELPARAM_VALUE.pxMAX PARAM_VALUE.pxMAX } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.pxMAX}] ${MODELPARAM_VALUE.pxMAX}
}

