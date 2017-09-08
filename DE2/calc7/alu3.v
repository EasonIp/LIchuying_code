module alu3(a,b,clk,rst_n,opcode,result);//改动1：修改模块名与端口名
//改动2：修改输入的位宽
	input [17:0] a,b;
	input clk;
	input rst_n;
	input [3:0] opcode;
//改动3：修改输出的位宽	
	output [17:0] result;
//改动4：添加用于源码补码转换的变量	
	wire [17:0] a_comp,b_comp;
	reg [17:0] bin_data; 
	
	reg [16:0] q,areg,breg; 
	reg state;
	
//改动5：加入原码转补码
	assign a_comp = a[17] ? {1'b1,((~a[16:0]) + 1'b1)} : a;
	assign b_comp = b[17] ? {1'b1,((~b[16:0]) + 1'b1)} : b;
	
//改动6：加入补码转原码
	assign result = bin_data[17] ? {1'b1,((~bin_data[16:0]) + 1'b1)} : bin_data;
//改动7：修改always块中的变量	
	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)	//复位时将所有寄存器赋初值
		begin
			bin_data <= 0;
			state <= 0;
			areg <= 0; 
			breg <= 0;
			q <= 0;
		end
		else
		begin
			case(opcode)
				10: begin bin_data <= a_comp + b_comp; end  
				11: begin bin_data <= a_comp - b_comp; end  
				12: begin bin_data <= a_comp * b_comp; end  
				13: //除法用原码计算
					begin 
						case(state)
						0:	//初始状态
							begin 
								areg <= a[16:0]; 
								breg <= b[16:0]; 
								state <= 1; 
								q <= 0; 
							end
						1:	//判断寄存器值是否大于被除数
							begin
								if(areg >= breg)
									begin
										areg <= areg - breg;
										state <= 1;
										q <= q + 1'b1;
									end
								else 
								begin
									state <= 0;
									bin_data <= a[17]^b[17] ? {1'b1,~(q - 1'b1)} : {1'b0,q};
								end
							end
						default: bin_data <= bin_data;
						endcase
					end 
				default: bin_data <= bin_data;
			endcase
		end
	end
	
endmodule
