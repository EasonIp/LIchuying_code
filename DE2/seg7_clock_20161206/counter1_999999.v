module counter1_999999 (clk, rst_n, data);

	input clk, rst_n;
	
	output reg [23:0] data;

	reg clk_10ms;
	
	parameter T10ms = 250_000;		// half width of 10ms / 20ns = 250_000
	reg [19:0] count;

	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					count <= 0;
					clk_10ms <= 1;
				end
			else
				begin
					if (count < T10ms - 1)
						count <= count + 20'd1;
					else
						begin
							count <= 0;
							clk_10ms <= ~clk_10ms;
						end
				end
		end
	
	always @ (posedge clk_10ms or negedge rst_n)
		begin
			if (!rst_n)
				data <= 24'h000000;									// 000000
			else
				if (data == 24'h999999)								// 999999
					data <= 24'h000000;
				else
					if (data[19:0] == 20'h99999)					// x99999
						data <= {(data[23:20] + 4'h1), 20'h00000};
					else
						if (data[15:0] == 16'h9999)				// xx9999
							data <= {(data[23:16] + 8'h1), 16'h0000};
						else
							if (data[11:0] == 12'h999)				// xxx999
								data <= {(data[23:12] + 12'h1), 12'h000};
							else
								if (data[7:0] == 8'h99)				// xxxx99
									data <= {(data[23:8] + 8'h1), 8'h00};
								else
									if (data[3:0] == 4'h9)			// xxxxx9
										data <= {(data[23:4] + 4'h1), 4'h0};
									else
										data <= data + 24'h1;		// xxxxxx
		end

endmodule
