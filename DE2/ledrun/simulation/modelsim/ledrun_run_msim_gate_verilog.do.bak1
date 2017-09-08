transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {ledrun.vo}

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/DE2/class/ledrun {D:/ZXOPEN2017/DE2/class/ledrun/ledrun_tb.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L cycloneii_ver -L gate_work -L work -voptargs="+acc" ledrun_tb

add wave *
view structure
view signals
run -all
