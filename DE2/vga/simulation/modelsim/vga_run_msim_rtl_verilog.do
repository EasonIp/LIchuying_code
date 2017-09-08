transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/vga {D:/ZXOPEN2017/DE2/class/vga/rgb.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/vga {D:/ZXOPEN2017/DE2/class/vga/top.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/vga {D:/ZXOPEN2017/DE2/class/vga/vga.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/vga {D:/ZXOPEN2017/DE2/class/vga/pll.v}

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/vga {D:/ZXOPEN2017/DE2/class/vga/top_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc" top_tb

add wave *
view structure
view signals
run -all
