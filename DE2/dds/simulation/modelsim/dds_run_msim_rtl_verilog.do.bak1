transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/dds {D:/ZXOPEN2017/DE2/class/dds/dds.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/dds {D:/ZXOPEN2017/DE2/class/dds/control.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/dds {D:/ZXOPEN2017/DE2/class/dds/rom.v}

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/dds {D:/ZXOPEN2017/DE2/class/dds/dds_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc" dds_tb

add wave *
view structure
view signals
run -all
