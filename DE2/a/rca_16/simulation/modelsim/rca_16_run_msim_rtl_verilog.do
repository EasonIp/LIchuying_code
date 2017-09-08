transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/a/rca_16 {D:/ZXOPEN2017/DE2/a/rca_16/rca_16.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/a/rca_16 {D:/ZXOPEN2017/DE2/a/rca_16/rca_4.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/a/rca_16 {D:/ZXOPEN2017/DE2/a/rca_16/adder_full.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/a/rca_16 {D:/ZXOPEN2017/DE2/a/rca_16/adder_half.v}

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/a/rca_16 {D:/ZXOPEN2017/DE2/a/rca_16/rca_16_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  rca_16_tb

add wave *
view structure
view signals
run -all
