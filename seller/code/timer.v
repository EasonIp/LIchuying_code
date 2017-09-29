module timer(clk, rst_n, t_rst_n, t_end);
	
	input clk, rst_n;
	input t_rst_n;
	
	output reg t_end;
	
	reg [31:0] count;
	
	parameter PULSE_CNT = 50_000_000 * 6;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					count <= 0;
					t_end <= 0;
				end
			else if (!t_rst_n)
				begin
					if (count < PULSE_CNT - 1)
						begin
							count <= count + 1;
							t_end <= 0;
						end
					else
						begin
							count <= 0;
							t_end <= 1;
						end
				end
		end	

endmodule
