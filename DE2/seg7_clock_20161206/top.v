module top (clk, rst_n, sel, seg);

	input clk, rst_n;
	
	output [2:0] sel;
	output [7:0] seg;
	
	wire [23:0] data;

//	wire [7:0] d12, d34, d56;

//  clock_controller  #(.T10ms(25_000))
//		clock_controller_inst (.clk(clk), .rst_n(rst_n), .data(data));
//
//	b2bcd_99 b2bcd_99_inst1 (.din(data[23:16]), .dout(d12)); 
//	b2bcd_99 b2bcd_99_inst2 (.din(data[15:8]), .dout(d34)); 
//	b2bcd_99 b2bcd_99_inst3 (.din(data[7:0]), .dout(d56)); 
//	
//	wire [23:0] data_BCD;
//	
//	counter_999999 #(.T10ms(25000)) 
//		counter_999999_inst (.clk(clk), .rst_n(rst_n), .data(data));
////	
//	b2bcd_999999 b2bcd_999999_inst (.din(data), .dout(data_BCD));
//////	
//	seg7 seg7_inst (.clk(clk), .rst_n(rst_n), .data(data_BCD), .sel(sel), .seg(seg));

//	counter_99 #(.T10ms(25000))
//			counter_99 (.clk(clk), .rst_n(rst_n), .data(data));
//			
//	seg7 seg7_inst (.clk(clk), .rst_n(rst_n), .data({d12, d34, d56}), .sel(sel), .seg(seg));
//	
	

	counter_9 #(.T10ms(25000)) 
		counter_9_inst (.clk(clk), .rst_n(rst_n), .data(data));
//	
	seg7 seg7_inst (.clk(clk), .rst_n(rst_n), .data(data), .sel(sel), .seg(seg));
	

endmodule
