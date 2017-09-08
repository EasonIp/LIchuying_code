module top (clk, rst_n, key_rd, key_wr, scl, sda, sel, seg);

	input clk, rst_n;
	input key_rd, key_wr;
	
	output scl;
	output [2:0] sel;
	output [7:0] seg;
	
	inout sda;
	
	wire [7:0] data_out;

	iic iic 
		(
			.clk(clk), 
			.rst_n(rst_n), 
			.key_rd(key_rd), 
			.key_wr(key_wr), 
			.data_in(8'h69), 
			.data_out(data_out), 
			.scl(scl), 
			.sda(sda)
		);
	
	seg7 seg7 
		(
			.clk(clk), 
			.rst_n(rst_n), 
			.data({16'habcd,data_out}), 
//			.data({16'habcd,8'hef}),
			.sel(sel), 
			.seg(seg)
		);


endmodule
