module rca_16(a, b, c_in, sum, c_out);

	input [15:0] a, b;
	input c_in;
	output [15:0] sum;
	output c_out;

	wire m0_cout, m1_cout, m2_cout;
	
	rca_4 m0(.a(a[3:0]), .b(b[3:0]), .c_in(c_in), .sum(sum[3:0]), .c_out(m0_cout));
	rca_4 m1(.a(a[7:4]), .b(b[7:4]), .c_in(m0_cout), .sum(sum[7:4]), .c_out(m1_cout));
	rca_4 m2(.a(a[11:8]), .b(b[11:8]), .c_in(m1_cout), .sum(sum[11:8]), .c_out(m2_cout));
	rca_4 m3(.a(a[15:12]), .b(b[15:12]), .c_in(m2_cout), .sum(sum[15:12]), .c_out(c_out));

endmodule
