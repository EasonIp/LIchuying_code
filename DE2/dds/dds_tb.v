`timescale 1ns/1ps

module dds_tb;

	reg clk, rst_n;
	
	wire [7:0] num;

	dds dut (.clk(clk), .rst_n(rst_n), .num(num));
	
	initial
		begin
			clk = 1;
			rst_n = 0;
			#200.1
			rst_n = 1;
			
			#200_000 $stop;		
		end
		
	always #10 clk = ~clk;

endmodule
