module counter_999999 (clk, rst_n, data);

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
				data <= 24'h000000;			// BCD clock 00:00:00
			else
				begin
					if (data == 24'h0F423F)			// 24'h0F423F = 999999
						data <= 24'h000000;
					else
						data <= data + 24'h1;		// data + 1
				end
		end

endmodule
