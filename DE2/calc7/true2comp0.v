module true2comp0(datain,dataout);

	input [17:0] datain;
	output [17:0] dataout;
	
	//判断符号位，负数减一取反，正数不变
	
	assign dataout = datain[17] ? {1'b1,(~(datain[16:0] - 1))} : datain;
	
endmodule

