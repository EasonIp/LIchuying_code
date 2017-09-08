`timescale 1ns/1ps

module fifo_tb;

	reg clk, rst_n;
	
	wire [7:0] q;
	
	fifo dut (.clk(clk), .rst_n(rst_n), .q(q));

	initial
		begin
			clk = 1;
			rst_n = 0;
			#200.1
			rst_n = 1;
			
			#20_000 $stop;
		end

	always #10 clk = ~clk;

endmodule
