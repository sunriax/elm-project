# elmProject Diploma work 2016/2017

*The elmProject is a Diplomaproject which has started in the*
*as a small Projet at the HTL-Rankweil. Three Students of the*
*school tryed to develop a system based on a ARM Linux uC and*
*an attached FPGA Device which can be extended over 4 slots on*
*the expanison Headers...*

**Please don´t hesitate to contact us**

## AIMs of the elmProject

**HARDWARE**
1. Build a Mainboard (6-Layer PCB)
	1. with an Xilinx FPGA (Xc7A35T)
	1. with a FIFO (FTDI 240X)
	1. with a 256 MBit SDRAM
	1. with a Programm Flash
	1. with a Bluetooth Module
1. Build a VGA/Sound cart do expand the Mainboard
	1. Soundcard with Wolfson WM8731 Codec
	1. VGA R/G/B output with resistors (Image from FPGA)
1. Build a Analog Board to Measure with the Xilinx XADC
	1. still under development

**SOFTWARE**
1. Run the ACME Arietta G25 uC (Linux)
	1. Compile neccesary Kernel Elements (e.G. Display, ...)
	1. Install and configure neccesary programms (Apache, SSH, ...)
1. Build a Konfiguration for the FPGA (VHDL)
	1. UART communication unit
	1. FIFO communication unit
	1. SDRAM configuration unit
	1. VGA configuration unit
	1. ...
1. Build a Webinterface (PHP/HTML)
	1. To control the whole Mainboard
	1. To Transfer images to the VGA Modul
	1. To Read out analog data
1. Build a Display Software (QT/C++)
	1. Build a Software for the ACME XTerm-01

**DOCUMENTATION**
1. Make a documentation to share the knowledge with other people
