`timescale 1ns/1ps

module rca_4_tb;

	reg [3:0] a, b; 
	reg c_in;
	wire [3:0] sum;
	wire c_out;
	integer i;

	rca_4 dut(.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));
	
	initial begin
		a = 0; b = 0; c_in = 0;
		forever begin
			for (i=0; i<16; i=i+1) begin
				#10 a = i; b = i; c_in = 0;
				#10 a = i; b = i; c_in = 1;
			end
		end
	end

	initial #1000 $stop;

endmodule
