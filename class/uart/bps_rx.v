module bps_rx (clk, rst_n, rx_en, rx_sel_data, rx_num);

	input clk, rst_n;
	input rx_en;
	
	output reg rx_sel_data;
	output reg [3:0] rx_num;

	parameter bps_div = 13'd5208;
	parameter bps_div_2 = 13'd2604;
	
	reg flag;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					flag <= 0;
				end
			else
				begin
					if (rx_en)
						begin
							flag <= 1;
						end
					else
						begin
							if (rx_num == 4'd10)
								flag <= 0;
						end
				end
		end

		
	reg [12:0] cnt;
		
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					cnt <= 13'd0;
				end
			else
				begin
					if (!flag)
						begin
							cnt <= 13'd0;
						end
					else
						begin
							if (cnt < bps_div - 1)
								begin
									cnt <= cnt + 13'd1;
								end
							else
								begin
									cnt <= 13'd0;
								end
						end
				end
		end
		
		
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin 
					rx_sel_data <= 1'b0;
				end
			else
				begin
					if (cnt == bps_div_2)
						begin
							rx_sel_data <= 1'b1;
						end
					else
						begin
							rx_sel_data <= 1'b0;
						end
				end
		end
		
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin 
					rx_num <= 4'd0;
				end
			else
				begin
					if (!flag)
						begin
							rx_num <= 4'd0;
						end
					else
						begin
							if (rx_num == 4'd10)
								begin
									rx_num <= 4'd0;
								end
							else
								begin
									if (rx_sel_data)
										rx_num <= rx_num + 4'd1;
								end
						end
				end
		end

endmodule
