`timescale 1ns/1ps

module led_cycle_2dir_tb;

	reg clk, rst_n, flag1, flag2;
	
	wire [3:0] pio_led;

	led_cycle_2dir dut(.clk(clk), .rst_n(rst_n), .flag1(flag1), .flag2(flag2),.pio_led(pio_led));
	
	initial begin
		clk = 1'b1;
		rst_n = 1'b0;
		flag1 = 0;
		flag2 = 0;
		#200.1
		rst_n = 1'b1;
		
		#20  flag1 = 1;
		#20  flag1 = 0;
		
		#200 flag2 = 1;
		#20  flag2 = 0;
		
		
	
		#200 $stop;
	end
	
	always #10 clk = ~clk;

endmodule
