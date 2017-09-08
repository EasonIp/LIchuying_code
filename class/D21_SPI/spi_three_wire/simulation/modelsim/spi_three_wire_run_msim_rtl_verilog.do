transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/class/D21_SPI/spi_three_wire {D:/ZXOPEN2017/class/D21_SPI/spi_three_wire/spi_three_wire.v}
vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/class/D21_SPI/spi_three_wire {D:/ZXOPEN2017/class/D21_SPI/spi_three_wire/spi_write.v}

vlog -vlog01compat -work work +incdir+D:/ZXOPEN2017/class/D21_SPI/spi_three_wire {D:/ZXOPEN2017/class/D21_SPI/spi_three_wire/spi_write_test.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  spi_write_test

add wave *
view structure
view signals
run -all
