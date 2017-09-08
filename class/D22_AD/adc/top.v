module top (clk, rst_n, adc_in, cs_n, adc_clk, sel, seg);

	input clk, rst_n;
	input adc_in;
	
	output adc_clk;
	output cs_n;
	output [2:0] sel;
	output [7:0] seg;
	
	wire [7:0] data8;
	wire [15:0] BCD4;
	wire [7:0] seg_o;

	adc adc (.clk(clk), .rst_n(rst_n), .sid(adc_in), .adc_clk(adc_clk), .cs_n(cs_n), .data(data8));
	
	pre_seg7 pre_seg7 (.clk(clk), .rst_n(rst_n), .data_in(data8), .BCD4(BCD4));
	
	seg7 seg7 (.clk(clk), .rst_n(rst_n), .data({8'b0, BCD4}), .sel(sel), .seg(seg_o));
	
	post_seg7 post_seg7 (.sel(sel), .seg_o(seg_o), .seg(seg));

endmodule
