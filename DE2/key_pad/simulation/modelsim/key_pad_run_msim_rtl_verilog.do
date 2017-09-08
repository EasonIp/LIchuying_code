transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/key_pad {D:/ZXOPEN2017/DE2/class/key_pad/key_pad.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/key_pad {D:/ZXOPEN2017/DE2/class/key_pad/pre_seg7.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/key_pad {D:/ZXOPEN2017/DE2/class/key_pad/seg7.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/key_pad {D:/ZXOPEN2017/DE2/class/key_pad/top.v}

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/key_pad {D:/ZXOPEN2017/DE2/class/key_pad/key_pad_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc" key_pad_tb

add wave *
view structure
view signals
run -all
