module iic (clk, rst_n, key_rd, key_wr, data_in, data_out, scl, sda);

	input clk, rst_n;
	input key_rd, key_wr;
	input [7:0] data_in;
	
	output reg [7:0] data_out;
	output reg scl;
	
	inout sda;
	
	reg sda_buffer;
	reg flag;
		
	assign sda = flag ? sda_buffer : 1'bz;

	
	reg [7:0] count;
	reg clk_sys;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					clk_sys <= 1'b0;
					count <= 8'd0;
				end
			else
				begin
					if (count < 31)
						begin
							count <= count + 8'd1;
						end
					else
						begin
							count <= 8'd0;
							clk_sys <= ~clk_sys;
						end
				end
		end

	reg [5:0] state;
		
	always @ (negedge clk_sys or negedge rst_n)
		begin
			if (!rst_n)
				begin
					scl <= 1'b1;
				end
			else
				begin
					if (state > 0)
						begin
							scl <= ~scl;
						end
					else
						begin
							scl <= 1'b1;
						end
				end
		end


	reg [1:0] en;
		
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					en <= 2'b00;
				end
			else
				begin
					if (!key_rd)
						begin
							en <= 2'b10;
						end
					else
						begin
							if (!key_wr)
								begin
									en <= 2'b01;
								end
						end
				end
		end
		
	
	reg [3:0] cnt;
	reg [1:0] temp;
	reg [7:0] memory;
	
	always @ (posedge clk_sys or negedge rst_n)
		begin
			if (!rst_n)
				begin 
					cnt <= 0;
					data_out <= 8'd0;
					state <= 0;
					temp <= 2'b00;
					flag <= 1'b1;
					sda_buffer <= 1'b1;
				end
			else
				begin
					case (state)
					0	:	begin
								if (scl)
									begin
										if (en != temp)
											begin
												sda_buffer <= 1'b0;
												state <= 1;
												temp <= en;
												memory <= 8'b1010_000_0;
											end
										else
											begin
												state <= 0;
											end
									end
								else
									begin
										state <= 0;
									end
							end
							
					1	:	begin
								if ((!scl) && (cnt < 8))
									begin
										sda_buffer <= memory[7];
										cnt <= cnt + 4'd1;
										memory <= {memory[6:0], memory[7]};
										state <= 1;
									end
								else
									begin
										if ((!scl) && (cnt == 8))
											begin
												cnt <= 0;
												flag <= 0;
												state <= 2;
											end
										else
											begin
												state <= 1;
											end
									end
							end
				
					2	:	begin
								if (!sda)
									begin
										state <= 3;
										memory <= 8'h00;
									end
								else
									begin
										state <= 0;
									end
							end
					
					3	:	begin
								if ((!scl) && (cnt < 8))
									begin
										flag <= 1;
										sda_buffer <= memory[7];
										cnt <= cnt + 4'd1;
										memory <= {memory[6:0], memory[7]};
										state <= 3;
									end
								else
									begin
										if ((!scl) && (cnt == 8))
											begin
												cnt <= 0;
												flag <= 0;
												state <= 4;
											end
										else
											begin
												state <= 3;
											end
									end
							end

					4	:	begin
								if (!sda)
									begin
										state <= 5;
										memory <= 8'h00;
									end
								else
									begin
										state <= 0;
									end
							end
					
					5	:	begin
								if ((!scl) && (cnt < 8))
									begin
										flag <= 1;
										sda_buffer <= memory[7];
										cnt <= cnt + 4'd1;
										memory <= {memory[6:0], memory[7]};
										state <= 5;
									end
								else
									begin
										if ((!scl) && (cnt == 8))
											begin
												cnt <= 0;
												flag <= 0;
												state <= 6;
											end
										else
											begin
												state <= 5;
											end
									end
							end

					6	:	begin
								if (!sda)
									begin
										if (temp == 2'b01)
											begin
												state <= 7;
												memory <= data_in[7:0];
											end
										else
											begin
												if (temp == 2'b10)
													begin
														state <= 11;
													end
											end
									end
								else
									begin
										state <= 0;
									end
							end
					
					7	:	begin
								if ((!scl) && (cnt < 8))
									begin
										flag <= 1;
										sda_buffer <= memory[7];
										cnt <= cnt + 4'd1;
										memory <= {memory[6:0], memory[7]};
										state <= 7;
									end
								else
									begin
										if ((!scl) && (cnt == 8))
											begin
												cnt <= 0;
												flag <= 0;
												state <= 8;
											end
										else
											begin
												state <= 7;
											end
									end
							end

					8	:	begin
								if (!sda)
									begin
										state <= 9;
									end
								else
									begin
										state <= 0;
									end
							end

					9	:	begin
								if (!scl)
									begin
										flag <= 1;
										sda_buffer <= 0;
										state <= 10;
									end
								else
									begin
										state <= 9;
									end
							end

					10	:	begin
								if (scl)
									begin
										sda_buffer <= 1;
										state <= 0;
									end
								else
									begin
										state <= 10;
									end
							end
							
					11	:	begin
								flag <= 1;
								sda_buffer <= 1;
								state <= 12;
							end
					
					12	:	begin
								sda_buffer <= 0;
								state <= 13;
								memory <= 8'b1010_000_1;
							end
							
					13	:	begin
								if ((!scl) && (cnt < 8))
									begin
										flag <= 1;
										sda_buffer <= memory[7];
										cnt <= cnt + 4'd1;
										memory <= {memory[6:0], memory[7]};
										state <= 13;
									end
								else
									begin
										if ((!scl) && (cnt == 8))
											begin
												cnt <= 0;
												flag <= 0;
												state <= 14;
											end
										else
											begin
												state <= 13;
											end
									end
							end
							
					14	:	begin
								if (!sda)
									begin
										state <= 15;
									end
								else
									begin
										state <= 0;
									end
							end
							
					15	:	begin
								if ((scl) && (cnt < 8))
									begin
										cnt <= cnt + 4'd1;
										memory <= {memory[6:0], sda};
										state <= 15;
									end
								else
									begin
										if ((!scl) && (cnt == 8))
											begin
												cnt <= 0;
												flag <= 1;
												state <= 16;
												sda_buffer <= 1;
											end
										else
											begin
												state <= 15;
											end
									end
							end
						
					16	:	begin
								data_out <= memory;
								state <= 17;
							end
					
					17	:	begin
								if (!scl)
									begin
										sda_buffer <= 0;
										state <= 18;
									end
								else
									begin
										state <= 17;
									end
							end
					
					18	:	begin
								if (scl)
									begin
										sda_buffer <= 1;
										state <= 0;
									end
								else
									begin
										state <= 18;
									end
							end

					default	:	state <= 0;
							
					endcase
				end
		end
	
	
	
		
endmodule
