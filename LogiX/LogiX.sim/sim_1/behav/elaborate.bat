@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.1\\bin
call %xv_path%/xelab  -wto eba76a601e01454d9154b3c9ae7b1085 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip -L xpm --snapshot uart_tb_behav xil_defaultlib.uart_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
