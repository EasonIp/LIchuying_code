module rgb (rgb30, r, g, b);

	input [29:0] rgb30;
	
	output [9:0] r, g, b;

	assign r = rgb30[29:20];
	assign g = rgb30[19:10];
	assign b = rgb30[ 9: 0];

endmodule
