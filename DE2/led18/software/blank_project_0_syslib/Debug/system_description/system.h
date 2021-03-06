/* system.h
 *
 * Machine generated for a CPU named "cpu" as defined in:
 * d:\ZXOPEN2017\DE2\class\led18\software\blank_project_0_syslib\..\..\led18_cpu.ptf
 *
 * Generated: 2017-03-12 16:03:34.534
 *
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/*

DO NOT MODIFY THIS FILE

   Changing this file will have subtle consequences
   which will almost certainly lead to a nonfunctioning
   system. If you do modify this file, be aware that your
   changes will be overwritten and lost when this file
   is generated again.

DO NOT MODIFY THIS FILE

*/

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2003 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
*                                                                             *
******************************************************************************/

/*
 * system configuration
 *
 */

#define ALT_SYSTEM_NAME "led18_cpu"
#define ALT_CPU_NAME "cpu"
#define ALT_CPU_ARCHITECTURE "altera_nios2"
#define ALT_DEVICE_FAMILY "CYCLONEII"
#define ALT_STDIN "/dev/null"
#define ALT_STDIN_TYPE ""
#define ALT_STDIN_BASE UNDEFINED VARIABLE %BASE_ADDRESS%
#define ALT_STDIN_DEV null
#define ALT_STDOUT "/dev/null"
#define ALT_STDOUT_TYPE ""
#define ALT_STDOUT_BASE UNDEFINED VARIABLE %BASE_ADDRESS%
#define ALT_STDOUT_DEV null
#define ALT_STDERR "/dev/null"
#define ALT_STDERR_TYPE ""
#define ALT_STDERR_BASE UNDEFINED VARIABLE %BASE_ADDRESS%
#define ALT_STDERR_DEV null
#define ALT_CPU_FREQ 50000000
#define ALT_IRQ_BASE NULL

/*
 * processor configuration
 *
 */

#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_BIG_ENDIAN 0

#define NIOS2_ICACHE_SIZE 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_FLUSHDA_SUPPORTED

#define NIOS2_EXCEPTION_ADDR 0x00003020
#define NIOS2_RESET_ADDR 0x00002000
#define NIOS2_BREAK_ADDR 0x00000820

#define NIOS2_HAS_DEBUG_STUB

#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0

/*
 * A define for each class of peripheral
 *
 */

#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO

/*
 * program configuration
 *
 */

#define PROGRAM_NAME "/dev/program"
#define PROGRAM_TYPE "altera_avalon_onchip_memory2"
#define PROGRAM_BASE 0x00002000
#define PROGRAM_SPAN 4096
#define PROGRAM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define PROGRAM_RAM_BLOCK_TYPE "M4K"
#define PROGRAM_INIT_CONTENTS_FILE "program"
#define PROGRAM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define PROGRAM_GUI_RAM_BLOCK_TYPE "Automatic"
#define PROGRAM_WRITEABLE 0
#define PROGRAM_DUAL_PORT 0
#define PROGRAM_SIZE_VALUE 4096
#define PROGRAM_SIZE_MULTIPLE 1
#define PROGRAM_USE_SHALLOW_MEM_BLOCKS 0
#define PROGRAM_INIT_MEM_CONTENT 1
#define PROGRAM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define PROGRAM_INSTANCE_ID "NONE"
#define PROGRAM_READ_DURING_WRITE_MODE "DONT_CARE"
#define PROGRAM_IGNORE_AUTO_BLOCK_TYPE_ASSIGNMENT 1
#define PROGRAM_CONTENTS_INFO "QUARTUS_PROJECT_DIR/program.hex 1489304591"
#define ALT_MODULE_CLASS_program altera_avalon_onchip_memory2

/*
 * data configuration
 *
 */

#define DATA_NAME "/dev/data"
#define DATA_TYPE "altera_avalon_onchip_memory2"
#define DATA_BASE 0x00003000
#define DATA_SPAN 4096
#define DATA_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define DATA_RAM_BLOCK_TYPE "M4K"
#define DATA_INIT_CONTENTS_FILE "data"
#define DATA_NON_DEFAULT_INIT_FILE_ENABLED 0
#define DATA_GUI_RAM_BLOCK_TYPE "Automatic"
#define DATA_WRITEABLE 1
#define DATA_DUAL_PORT 0
#define DATA_SIZE_VALUE 4096
#define DATA_SIZE_MULTIPLE 1
#define DATA_USE_SHALLOW_MEM_BLOCKS 0
#define DATA_INIT_MEM_CONTENT 0
#define DATA_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define DATA_INSTANCE_ID "NONE"
#define DATA_READ_DURING_WRITE_MODE "DONT_CARE"
#define DATA_IGNORE_AUTO_BLOCK_TYPE_ASSIGNMENT 1
#define DATA_CONTENTS_INFO "QUARTUS_PROJECT_DIR/data.hex 1489304593"
#define ALT_MODULE_CLASS_data altera_avalon_onchip_memory2

/*
 * led18_pio configuration
 *
 */

#define LED18_PIO_NAME "/dev/led18_pio"
#define LED18_PIO_TYPE "altera_avalon_pio"
#define LED18_PIO_BASE 0x00000000
#define LED18_PIO_SPAN 16
#define LED18_PIO_DO_TEST_BENCH_WIRING 0
#define LED18_PIO_DRIVEN_SIM_VALUE 0
#define LED18_PIO_HAS_TRI 0
#define LED18_PIO_HAS_OUT 1
#define LED18_PIO_HAS_IN 0
#define LED18_PIO_CAPTURE 0
#define LED18_PIO_DATA_WIDTH 18
#define LED18_PIO_RESET_VALUE 0
#define LED18_PIO_EDGE_TYPE "NONE"
#define LED18_PIO_IRQ_TYPE "NONE"
#define LED18_PIO_BIT_CLEARING_EDGE_REGISTER 0
#define LED18_PIO_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LED18_PIO_FREQ 50000000
#define ALT_MODULE_CLASS_led18_pio altera_avalon_pio

/*
 * system library configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none

/*
 * Devices associated with code sections.
 *
 */

#define ALT_TEXT_DEVICE       PROGRAM
#define ALT_RODATA_DEVICE     DATA
#define ALT_RWDATA_DEVICE     DATA
#define ALT_EXCEPTIONS_DEVICE DATA
#define ALT_RESET_DEVICE      PROGRAM

/*
 * The text section is initialised so no bootloader will be required.
 * Set a variable to tell crt0.S to provide code at the reset address and
 * to initialise rwdata if appropriate.
 */

#define ALT_NO_BOOTLOADER


#endif /* __SYSTEM_H_ */
