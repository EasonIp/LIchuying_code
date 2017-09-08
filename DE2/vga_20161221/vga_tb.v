`timescale 1ns/1ps

module vga_tb;

	reg clk, rst_n;
	
	wire [2:0] r, g;
	wire [1:0] b;
	wire hsync, vsync;

	
	vga dut(.clk(clk), .rst_n(rst_n), .r(r), .g(g), .b(b), .hsync(hsync), .vsync(vsync));
	
	initial begin
		clk = 1;
		rst_n = 0;
		#200.1
		rst_n = 1;
		
		#800_000 $stop;
	end
	
	always #10 clk = ~clk;

endmodule
