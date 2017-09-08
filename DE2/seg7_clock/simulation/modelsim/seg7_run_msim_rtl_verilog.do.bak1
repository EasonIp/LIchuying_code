transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/seg7_clock {D:/ZXOPEN2017/DE2/class/seg7_clock/b2bcd_99.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/seg7_clock {D:/ZXOPEN2017/DE2/class/seg7_clock/clock_controller.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/seg7_clock {D:/ZXOPEN2017/DE2/class/seg7_clock/seg7.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/seg7_clock {D:/ZXOPEN2017/DE2/class/seg7_clock/top.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/seg7_clock {D:/ZXOPEN2017/DE2/class/seg7_clock/LCD_Controller.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/seg7_clock {D:/ZXOPEN2017/DE2/class/seg7_clock/LCD_TEST.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/seg7_clock {D:/ZXOPEN2017/DE2/class/seg7_clock/Reset_Delay.v}

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/seg7_clock {D:/ZXOPEN2017/DE2/class/seg7_clock/seg7_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc" seg7_tb

add wave *
view structure
view signals
run -all
