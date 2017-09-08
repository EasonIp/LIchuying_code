`timescale 1ns/1ps

module seg7_tb;

	reg rst_n;
	reg [3:0] data;

	wire [6:0] hex;
	
	seg7 dut (.rst_n(rst_n), .data(data), .hex(hex));

	initial
		begin
			rst_n = 0;
			data = 4'h5;
			#200.1
			rst_n = 1;
			
			#1000 $stop;
		end

endmodule
