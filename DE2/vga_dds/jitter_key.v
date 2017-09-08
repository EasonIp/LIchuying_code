module jitter_key(          // ���ڱ��ؼ��İ�������
		clk,
		rst_n,
		key,       //�ⲿ��������
		key_out    //��������������
	);  

	input clk, rst_n;
	input key;

	output reg key_out;

	reg key_r;   //��ֵ�Ĵ���

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
	
	assign neg_edge = key_r & (~key);  //����֮�����һ�����ڵļ������

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
								if(neg_edge) //��һ�μ�⵽����
									state <= 1;
							end
							
					1	:	begin
								if(neg_edge) //�ٴμ�⵽����
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

	reg state_pos;//�����������Ĵ���

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
										state_pos <= 1;  //��Verilog�﷨�У�2����2�����ϵ��������begin end ��Ȼ�������
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