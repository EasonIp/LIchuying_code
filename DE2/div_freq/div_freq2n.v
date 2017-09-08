module div_freq2n (clk, rst_n, clk_out);

	input clk, rst_n;
	
	output reg clk_out;
	
	parameter CNT_NUM = 50;	// half of 100

	reg [25:0] cnt;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					cnt <= 0;
					clk_out <= 1;
				end
			else
				begin
					if (cnt < CNT_NUM - 1)
						begin
							cnt <= cnt + 26'd1;
						end
					else
						begin
							cnt <= 0;
							clk_out <= ~clk_out;
						end
				end
		end

endmodule
