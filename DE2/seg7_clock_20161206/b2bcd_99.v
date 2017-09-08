module b2bcd_99 (din, dout);

	input [7:0] din;
	
	output [7:0] dout;

	assign dout = din + (din / 8'd10)*8'd6;

endmodule
