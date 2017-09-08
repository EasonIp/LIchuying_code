module pre_seg7 (clk, rst_n, data, flag, data8);

	input clk, rst_n;
	input [3:0] data;
	input flag;
	
	output reg [31:0] data8;

	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				data8 <= 32'h0000_0000;
			else
				begin
					if (!flag)
						data8 <= data8;
					else
						data8 <= {data8[27:0], data};
				end
		end

endmodule
