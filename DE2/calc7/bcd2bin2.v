module bcd2bin2(BCDa,BCDb,a,b);//改动1：修改模块名
//改动2：修改输入输出的位宽
	input [20:0] BCDa,BCDb;
	output [17:0] a,b;
//改动3：保留符号位，其余位进行转换
	assign a[16:0] = BCDa[19:16]*10000 + BCDa[15:12]*1000 + BCDa[11:8]*100 + BCDa[7:4]*10+ BCDa[3:0];
	
	assign a[17] = BCDa[20];
	
	assign b[16:0] = {BCDb[20] , BCDb[19:16]*10000 + BCDb[15:12]*1000 + BCDb[11:8]*100 + BCDb[7:4]*10+ BCDb[3:0]};
	
	assign b[17] = BCDb[20];
	
endmodule
