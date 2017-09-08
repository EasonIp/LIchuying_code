module div_freq (clk, rst_n, clk_out);

	input clk, rst_n;
	
	output reg clk_out;
	
	parameter	HW = 50,
					LW = 50;		// HW + LW = 100 times cycle

	reg [1:0] state;
	
	localparam	s0 = 2'b0,
					s1 = 2'b1;
					
	reg [25:0] cnt;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					cnt <= 0;
					clk_out <= 1;
					state <= s0;
				end
			else
				begin
					case (state)
					s0	:	begin
								if (cnt < HW - 1)				// HW part
									begin
										cnt <= cnt + 26'd1;
										clk_out <= 1;
										state <= s0;
									end
								else
									begin
										cnt <= 0;
										clk_out<= 1;
										state <= s1;
									end
							end
					
					s1	:	begin
								if (cnt < LW - 1)				// LW part
									begin
										cnt <= cnt + 26'd1;
										clk_out <= 0;
										state <= s1;
									end
								else
									begin
										cnt <= 0;
										clk_out<= 0;
										state <= s0;
									end
							end
					
					default	:	state <= s0;
					
					endcase
				end
		end

endmodule
