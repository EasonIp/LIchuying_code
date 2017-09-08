transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/and_gate {D:/ZXOPEN2017/DE2/class/and_gate/and_gate.v}

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/and_gate {D:/ZXOPEN2017/DE2/class/and_gate/and_gate_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc" and_gate_tb

add wave *
view structure
view signals
run -all
