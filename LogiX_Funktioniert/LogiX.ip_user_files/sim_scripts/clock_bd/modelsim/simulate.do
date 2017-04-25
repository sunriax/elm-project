onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.clock_bd xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {clock_bd.udo}

run -all

quit -force
