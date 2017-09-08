/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>

int main(void)
{
alt_u8 led = 0x2;
volatile int i;
/*
* Infinitly shift a variable with one bit set back and forth, and write
* it to the LED PIO. Software loop provides delay element.
*/
while (1)
{
    i = 0;  while (i<200000)i++;    led=0x1;
    IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, led);
    i = 0;  while (i<200000)i++;    for(i=0;i<300000;i++)led=0x2;
    IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, led);
    i = 0;  while (i<200000)i++;    for(i=0;i<300000;i++)led=0x4;
    IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, led);
    i = 0;  while (i<200000)i++;    for(i=0;i<300000;i++)led=0x8;
    IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, led);
}

return 0;
}