module jitter_key(          // 基于边沿检测的按键消抖
		clk,
		rst_n,
		key,       //外部按键输入
		key_out    //按键尖峰脉冲输出
	);  

	input clk, rst_n;
	input key;

	output reg key_out;

	reg key_r;   //键值寄存器

	reg [19:0]count;
	reg state;
	
	parameter T20ms = 1_000_000;

	always@(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				key_r <= 1;
			else
				key_r <= key;
		end 

	wire neg_edge;
	
	assign neg_edge = key_r & (~key);  //按键之后出现一个周期的尖峰脉冲

	always@(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					count <= 0;
					state <= 0;
				end
			else
				begin
					case(state)
					0	:	begin
								if(neg_edge) //第一次检测到抖动
									state <= 1;
							end
							
					1	:	begin
								if(neg_edge) //再次检测到抖动
									begin
										state <= 0;
										count <= 0;
									end
								else
									begin
										if(count < T20ms - 1)
//										if(count < 16'd2)
											count <= count +1;
										else
											begin
												state <= 0;
												count <= 0;
											end
									end
							end
							
					default	:	state <= 0;
					
					endcase	
				end
		end

	reg state_pos;//尖峰脉冲输出寄存器

	always@(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					state_pos <= 0;
					key_out <= 0;
				end
			else
				begin
					case(state_pos)
					0	:	begin
								if(count == T20ms - 1)
//								if(count == 16'd2)
									begin
										state_pos <= 1;  //在Verilog语法中，2条或2条以上的语句必须加begin end 不然结果错误
										key_out <= 1;
									end
							end
							
					1	:	begin
								state_pos <= 0;
								key_out <= 0;
							end
							
					default	:	state_pos <= 0;
					
					endcase
				end
		end
		
endmodule 