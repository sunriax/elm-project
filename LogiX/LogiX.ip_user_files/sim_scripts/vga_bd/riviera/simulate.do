onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+vga_bd -L xil_defaultlib -L xpm -L util_vector_logic_v2_0_1 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.vga_bd xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {vga_bd.udo}

run -all

endsim

quit -force
