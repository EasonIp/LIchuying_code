`timescale 1ns/1ps

module check_edge_tb;

	reg clk, rst_n;
	reg signal;
	
	wire neg_flag, pos_flag;

	check_edge dut (
			.clk(clk), 
			.rst_n(rst_n), 
			.signal(signal), 
			.neg_flag(neg_flag), 
			.pos_flag(pos_flag)
		);
		
	initial
		begin
			clk = 1;
			rst_n = 0;
			signal = 1;
			#200.1
			rst_n = 1;
			
			#200
			signal = 0;
			#200
			signal = 1;
			#200
			
			$stop;
		end
		
	always #10 clk = ~clk;

endmodule
