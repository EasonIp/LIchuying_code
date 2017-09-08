module bin2bcd2(clk,rst_n,bin,bcd);//改动1：修改模块名
	
	input clk,rst_n;
//改动2：修改输入位宽
	input [17:0] bin;
	output reg [20:0] bcd;
//改动3：修改寄存器位宽
	reg [17:0] regdata,regdata1;
	reg [3:0] w1,w2,w3,w4,w5;	//w1~w5分别表示BCD码的个位~万位
	reg [1:0] state;
	reg [4:0] q;
//改动4：修改always块中的位宽	
	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)	//复位时清空所有寄存器
		begin
			state <= 0;
			bcd <= 0;
			regdata <= 0;
			regdata1 <= 0;
			w1 <= 0;
			w2 <= 0;
			w3 <= 0;
			w4 <= 0;
			w5 <= 0;
			q <= 0;
		end
		else
		case(state)
		0:	//初始状态，给寄存器赋初始值
			begin
				regdata <= bin;
				regdata1 <= bin;
				state <= 1;
				w1 <= 0;
				w2 <= 0;
				w3 <= 0;
				w4 <= 0;
				w5 <= 0;
				q <= 0;
			end

		1:	//移位状态，每移位1次计数器q值加1。
			begin
				q <= q + 1;
				regdata[16:0] <= (regdata[16:0] << 1);
				w1 <= {w1[2:0],regdata[16]};
				w2 <= {w2[2:0],w1[3]};
				w3 <= {w3[2:0],w2[3]};
				w4 <= {w4[2:0],w3[3]};
				w5 <= {w5[2:0],w4[3]};
				if(q == 16)	//因为是17位二进制转BCD，所以移位17次即可
				begin
					state <= 3;	//转换完成后跳至状态3输出结果并等待
				end
				else
					state <= 2;	//未完成则跳至状态2判断每一位是否大于等于5
			end

		2: 	//判断每一位是否大于等于5，是则自加3，并跳回状态1进行下一次移位
			begin
				state <= 1;
				if(w1 >= 5)
					w1 <= w1 + 3;
				else
					w1 <= w1;
				if(w2 >= 5)
					w2 <= w2 + 3;
				else
					w2 <= w2;
				if(w3 >= 5)
					w3 <= w3 + 3;
				else
					w3 <= w3;
				if(w4 >= 5)
					w4 <= w4 + 3;
				else
					w4 <= w4;
				if(w5 >= 5)
					w5 <= w5 + 3;
				else
					w5 <= w5;
			end

		3:	//完成状态，输出转换完成的BCD码并等待输入的变化
			begin
				bcd <= {regdata[17],w5,w4,w3,w2,w1};//将符号位、个位~万位拼起来
				if(regdata1 != bin)	//regdata1不等于bin说明输入发生变化
					state <= 0;	//跳回初始状态，以进行下一次转换
				else
					state <= 3;	//输入没变化则停留在此状态等待
			end
		endcase
	end
	
endmodule
