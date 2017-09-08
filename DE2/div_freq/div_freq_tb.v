`timescale 1ns/1ps

module div_freq_tb;

	reg clk, rst_n;
	
	wire clk_out;
	
	div_freq #(.HW(2), .LW(3)) dut (.clk(clk), .rst_n(rst_n), .clk_out(clk_out));

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
