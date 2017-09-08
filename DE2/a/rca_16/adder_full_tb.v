`timescale 1ns/1ps

module adder_full_tb;

	reg a, b, c_in;
	wire sum, c_out;

	adder_full dut(.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));
	
	initial begin
		a = 0; b = 0; c_in = 0;
		
		forever begin
			#10	a = 0; b = 0; c_in = 0;
			#10	a = 1; b = 0; c_in = 0;
			#10	a = 0; b = 1; c_in = 0;
			#10	a = 1; b = 1; c_in = 0;
			#10	a = 0; b = 0; c_in = 1;
			#10	a = 1; b = 0; c_in = 1;
			#10	a = 0; b = 1; c_in = 1;
			#10	a = 1; b = 1; c_in = 1;
		end
	end

	initial #1000 $stop;

endmodule
