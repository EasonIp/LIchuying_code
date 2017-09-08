module adder_half (a, b, sum, c_out);

	input a, b;
	
	output sum;
	output c_out;

	assign sum = a ^ b;
	assign c_out = a & b;

endmodule
