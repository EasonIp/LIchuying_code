`timescale 1ns/1ps

module pll_tb;

	reg clk, rst_n;
	
	wire clk_25M, clk_100M;
	wire locked;

	pll dut (.clk(clk), .rst_n(rst_n), .clk_25M(clk_25M), .clk_100M(clk_100M), .locked(locked));

	initial
		begin
			clk = 1;
			rst_n = 0;
			#200.1
			rst_n = 1;
			
			#1000 $stop;
		end
		
	always #10 clk = ~clk;

endmodule
