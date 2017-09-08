module adder_full(a, b, c_in, sum, c_out);

	input a, b;
	input c_in;
	output sum;
	output c_out;

	wire h0_sum, h0_cout, h1_cout;

	adder_half h0(.a(a), .b(b), .sum(h0_sum), .c_out(h0_cout));
	adder_half h1(.a(c_in), .b(h0_sum), .sum(sum), .c_out(h1_cout));
	
	assign c_out = h0_cout | h1_cout;

endmodule
