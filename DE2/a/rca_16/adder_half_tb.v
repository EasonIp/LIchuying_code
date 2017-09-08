`timescale 1ns/1ps

module adder_half_tb;

	reg a, b;
	wire sum, c_out;

	adder_half dut(.a(a), .b(b), .sum(sum), .c_out(c_out));
	
	initial begin
		a = 0; b = 0;
		
		forever begin
			#10	a = 0; b = 0;
			#10	a = 1; b = 0;
			#10	a = 0; b = 1;
			#10	a = 1; b = 1;
		end
	end
	
	initial #1000 $stop;

endmodule
