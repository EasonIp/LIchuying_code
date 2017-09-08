module b2bcd_999999 (din, dout);

	input [23:0] din;
	
	output [23:0] dout;

	assign dout = din 	+ (din / 24'd10) 			* 24'h6 
								+ (din / 24'd100) 		* 24'h60 			// 24'h60 		= 6 * 16
								+ (din / 24'd1000) 		* 24'h600 			// 24'h600 		= 6 * 16 * 16
								+ (din / 24'd10_000) 	* 24'h6000 			// 24'h6000 	= 6 * 16 * 16 * 16
								+ (din / 24'd100_000) 	* 24'h60000; 		// 24'h60000 	= 6 * 16 * 16 * 16 * 16

endmodule
