transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2016/class161126/20160529/vga_20161220 {D:/ZXOPEN2016/class161126/20160529/vga_20161220/rom.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2016/class161126/20160529/vga_20161220 {D:/ZXOPEN2016/class161126/20160529/vga_20161220/vga.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2016/class161126/20160529/vga_20161220 {D:/ZXOPEN2016/class161126/20160529/vga_20161220/pll.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2016/class161126/20160529/vga_20161220 {D:/ZXOPEN2016/class161126/20160529/vga_20161220/rgb.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2016/class161126/20160529/vga_20161220 {D:/ZXOPEN2016/class161126/20160529/vga_20161220/vga_driver3.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2016/class161126/20160529/vga_20161220/db {D:/ZXOPEN2016/class161126/20160529/vga_20161220/db/pll_altpll.v}

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2016/class161126/20160529/vga_20161220 {D:/ZXOPEN2016/class161126/20160529/vga_20161220/vga_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  vga_tb

add wave *
view structure
view signals
run -all
