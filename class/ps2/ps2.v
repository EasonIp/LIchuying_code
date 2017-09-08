module ps2 (clk, rst_n, ps2_clk, ps2_data_in, ps2_data_out, valid);
	
	input clk, rst_n;
	input ps2_clk;
	input ps2_data_in;
	
	output reg [7:0] ps2_data_out;
	output reg valid;
	
	
	wire neg;
	reg ps2_clk_temp;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					ps2_clk_temp <= 0;
				end
			else
				begin
					ps2_clk_temp <= ps2_clk;
				end
		end
	
	assign neg = ps2_clk_temp && (~ps2_clk);
	
	
	reg [3:0] num;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					num <= 0;
					valid <= 0;
					ps2_data_out <= 0;
				end
			else
				begin
					if (!neg)
						begin
							valid <= 0;
						end
					else
						begin
							case (num)
							0	:	num <= num + 4'd1;
							
							1	:	begin
										num <= num + 4'd1;
										ps2_data_out[0] <= ps2_data_in;
									end
							
							2	:	begin
										num <= num + 4'd1;
										ps2_data_out[1] <= ps2_data_in;
									end
							
							3	:	begin
										num <= num + 4'd1;
										ps2_data_out[2] <= ps2_data_in;
									end
							
							4	:	begin
										num <= num + 4'd1;
										ps2_data_out[3] <= ps2_data_in;
									end
							
							5	:	begin
										num <= num + 4'd1;
										ps2_data_out[4] <= ps2_data_in;
									end
							
							6	:	begin
										num <= num + 4'd1;
										ps2_data_out[5] <= ps2_data_in;
									end
							
							7	:	begin
										num <= num + 4'd1;
										ps2_data_out[6] <= ps2_data_in;
									end
							
							8	:	begin
										num <= num + 4'd1;
										ps2_data_out[7] <= ps2_data_in;
									end
							
							9	:	begin
										num <= num + 4'd1;
										valid <= 1;
									end
							
							10	:	begin
										num <= 0;
									end
							
							endcase
						end
				end
		end

endmodule
