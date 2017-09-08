#!/bin/sh
#
# generated.sh - shell script fragment - not very useful on its own
#
# Machine generated for a CPU named "cpu_0" as defined in:
# d:\ZXOPEN2017\DE2\class\led_nios\hello_led_0\hello_led_0_syslib\..\..\led_nios_cpu.ptf
#
# Generated: 2017-03-09 17:20:15.318

# DO NOT MODIFY THIS FILE
#
#   Changing this file will have subtle consequences
#   which will almost certainly lead to a nonfunctioning
#   system. If you do modify this file, be aware that your
#   changes will be overwritten and lost when this file
#   is generated again.
#
# DO NOT MODIFY THIS FILE

# This variable indicates where the PTF file for this design is located
ptf=d:\ZXOPEN2017\DE2\class\led_nios\hello_led_0\hello_led_0_syslib\..\..\led_nios_cpu.ptf

# This variable indicates whether there is a CPU debug core
nios2_debug_core=yes

# This variable indicates how to connect to the CPU debug core
nios2_instance=1

# This variable indicates the CPU module name
nios2_cpu_name=cpu_0

# Include operating system specific parameters, if they are supplied.

if test -f /cygdrive/d/altera/90/nios2eds/components/altera_hal/build/os.sh ; then
   . /cygdrive/d/altera/90/nios2eds/components/altera_hal/build/os.sh
fi
