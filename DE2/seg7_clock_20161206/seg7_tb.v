`timescale 1ns/1ps

module seg7_tb;

	reg clk, rst_n;
	reg [23:0] data;

	wire [2:0] sel;
	wire [7:0] seg;

	seg7 dut (.clk(clk), .rst_n(rst_n), .data(data), .sel(sel), .seg(seg));

	initial
		begin
			clk = 1;
			rst_n = 0;
			data = 24'h012345;
			#200.1
			rst_n = 1;
			
			#10_000_000 $stop;
		end

	always #10 clk = ~clk;	

endmodule
