`timescale 1ns/1ns

module key_tb;

	reg clk, rst_n, keyin_n;
	
	wire key_flag;

	key	#(.T20ms(20))	dut(.clk(clk), .rst_n(rst_n), .keyin_n(keyin_n), .key_flag(key_flag));

	initial
		begin
			clk = 1;
			rst_n = 0;
			keyin_n = 1;
			#200.1		rst_n = 1;

			#100			keyin_n = 0;
			#40 			keyin_n = 1;
			#40			keyin_n = 0;
			#40 			keyin_n = 1;
			#40			keyin_n = 0;
			#1000 		keyin_n = 1;
			#40			keyin_n = 0;
			#40 			keyin_n = 1;
			#40			keyin_n = 0;
			#40 			keyin_n = 1;

			#2000			keyin_n = 0;
			#40 			keyin_n = 1;
			#40			keyin_n = 0;
			#40 			keyin_n = 1;
			#40			keyin_n = 0;
			
			#2000 $stop;
		end

	always #10 clk = ~clk;
	

endmodule 