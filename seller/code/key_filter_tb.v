`timescale 1ns/1ns
module key_filter_tb;

	reg clk;
	reg rst_n;
	reg key_in;
	
	wire key_out;

	initial
		begin
			clk = 1;
			rst_n = 0;
			key_in = 1;
			#1000
			rst_n = 1;
			#1000
			key_in = 0;
			#40 key_in = 1;
			#20 key_in = 0;
			#200 key_in = 1;
			#40 key_in = 0;
			#2000 key_in = 1;
			#20 key_in = 0;
			#40 key_in = 1;
			#100 key_in = 0;
			#400 key_in = 1;
			#1000 $stop;		
		end
	
	always #10 clk = ~clk;

	key_filter 	#(.MASK_TIME(25))	key_filter(.clk(clk), .rst_n(rst_n), .key_in(key_in), .key_out(key_out));

endmodule 