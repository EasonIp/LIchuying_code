transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2016/class/ps2 {D:/ZXOPEN2016/class/ps2/ps2.v}

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2016/class/ps2 {D:/ZXOPEN2016/class/ps2/ps2_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  ps2_tb

add wave *
view structure
view signals
run -all
