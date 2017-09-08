#!/bin/sh
#
# generated.sh - shell script fragment - not very useful on its own
#
# Machine generated for a CPU named "cpu" as defined in:
# d:\ZXOPEN2017\DE2\class\led18\software\blank_project_0_syslib\..\..\led18_cpu.ptf
#
# Generated: 2017-03-12 16:09:24.335

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
ptf=d:\ZXOPEN2017\DE2\class\led18\software\blank_project_0_syslib\..\..\led18_cpu.ptf

# This variable indicates whether there is a CPU debug core
nios2_debug_core=yes

# This variable indicates how to connect to the CPU debug core
nios2_instance=0

# This variable indicates the CPU module name
nios2_cpu_name=cpu

# Include operating system specific parameters, if they are supplied.

if test -f /cygdrive/d/altera/90/nios2eds/components/altera_hal/build/os.sh ; then
   . /cygdrive/d/altera/90/nios2eds/components/altera_hal/build/os.sh
fi
