module calc7(clk,rst_n,seg,sel,keyin,keyscan);//改动1：修改模块名
	
	input clk, rst_n;
	input [3:0] keyin;
	
	output [3:0] keyscan;
	output [2:0] sel;
	output [7:0] seg;
	
	wire clk_slow;
	wire [4:0] real_number;
	wire [20:0] BCDa,BCDb,result,ainvisdata,binvisdata;
	wire [17:0] a,b,bin_data;	
	wire [3:0] opcode;

//改动2：更新以下各个实例化的模块名	
	display5 u1(
				.clk(clk),
				.adata(ainvisdata),	
				.bdata(binvisdata),	
				.rst_n(rst_n),
				.sel(sel),
				.seg(seg),
				.clk_slow(clk_slow)
				);
				
	keyscan0 u2(
				.clk(clk_slow),
				.rst_n(rst_n),
				.keyscan(keyscan),
				.keyin(keyin),
				.real_number(real_number)
				);
	
	key2bcd3 u3(
				.clk(clk_slow),
				.real_number(real_number),
				.opcode(opcode),
				.rst_n(rst_n),
				.BCDa(BCDa),
				.BCDb(BCDb),
				.result(result)
				);
	
	bcd2bin2 u4(
				.BCDa(BCDa),
				.BCDb(BCDb),
				.a(a),
				.b(b)
				);
	
	bin2bcd2 u5(	
				.clk(clk),
				.rst_n(rst_n),
				.bin(bin_data),
				.bcd(result)
				);
				
	alu3 u6(	
			.a(a),
			.b(b),
			.clk(clk),
			.rst_n(rst_n),
			.opcode(opcode),
			.result(bin_data)
			);
	
	invis1 u7(	
				.clk(clk_slow),
				.rst_n(rst_n),
				.datain(BCDa),
				.dataout(ainvisdata)
				);
	
	invis1 u8(
				.clk(clk_slow),
				.rst_n(rst_n),
				.datain(BCDb),
				.dataout(binvisdata)
				);
	
endmodule
