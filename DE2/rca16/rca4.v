module rca4 (a, b, c_in, sum, c_out);

	input [3:0] a, b;
	input c_in;
	
	output [3:0] sum;
	output c_out;

	wire b0_cout, b1_cout, b2_cout;
	
	adder_full b0 (.a(a[0]), .b(b[0]), .c_in(c_in), .sum(sum[0]), .c_out(b0_cout));
	adder_full b1 (.a(a[1]), .b(b[1]), .c_in(b0_cout), .sum(sum[1]), .c_out(b1_cout));
	adder_full b2 (.a(a[2]), .b(b[2]), .c_in(b1_cout), .sum(sum[2]), .c_out(b2_cout));
	adder_full b3 (.a(a[3]), .b(b[3]), .c_in(b2_cout), .sum(sum[3]), .c_out(c_out));

endmodule
