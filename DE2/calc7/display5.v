module display5(clk, rst_n, adata, bdata, sel, seg, clk_slow);//改动1：修改模块名
	
	input clk;
	input rst_n;
//改动2：修改输入线宽
	input [20:0] adata,bdata;	//线宽改为21位
	output reg [2:0] sel;
	output reg [7:0] seg;
//改动3：修改输出线宽	
	wire [20:0] data;		//线宽改为21位
	reg [3:0] segdata;
	reg [23:0] cnt;
	output reg clk_slow;
//改动4：修改判断条件，增加首位符号位	
	assign data = (bdata == 21'h0dddd0) ? adata : bdata; //这里需要修改，21'h0dddd0表示0
	
	always @ (posedge clk) //时钟分频
	begin 
		if(!rst_n)
		begin
			cnt <= 0;
			clk_slow <= 1;
		end
		else
		begin
			cnt <= cnt + 1;
			clk_slow <= cnt[12];
		end
	end
	
	always @ (posedge clk_slow or negedge rst_n) //sel扫描
	begin
		if(!rst_n)
		begin
			sel <= 0;
		end
		else
		begin
			sel <= sel + 1;
			if(sel >= 5)
				sel <= 0;
		end
	end
	
	always @ (*) //将输入的32位数拆成8个数，每4位二进制表示1个十进制数（0—9）
	begin
		if(!rst_n)
		begin
			segdata <= 0;
		end
		else
		begin
			case(sel)
				5: segdata <= data[3:0];	//个位
				4: segdata <= data[7:4];	//十位
				3: segdata <= data[11:8]; 	//百位
				2: segdata <= data[15:12]; //千位
				1: segdata <= data[19:16]; //万位
				0: segdata <= data[20] ? 10 : 11; //改动5：符号位，10表示负数，11表示正数
				default: segdata <= 0;
			endcase
		end
	end
	
	always @ (*) //把数字转换成seg对应的组合
	begin
		if(!rst_n)
		begin
			seg <= 8'hff;
		end
		else
		begin
			case(segdata)
				0: seg <= 8'b11000000;
				1: seg <= 8'b11111001;
				2: seg <= 8'b10100100;
				3: seg <= 8'b10110000;
				4: seg <= 8'b10011001;
				5: seg <= 8'b10010010;
				6: seg <= 8'b10000010;
				7: seg <= 8'b11111000;
				8: seg <= 8'b10000000;
				9: seg <= 8'b10010000;
				10:seg <= 8'b10111111;	//加入负号的显示编码
				default: seg <= 8'b11111111;
			endcase
		end
	end

endmodule
