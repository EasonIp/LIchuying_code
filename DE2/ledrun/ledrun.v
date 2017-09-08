module ledrun (clk, rst_n, led);

	input clk, rst_n;
	
	output reg [3:0] led;

	parameter T1s = 50_000_000;
	
	reg [25:0] count;
	reg [1:0] state;
	localparam	s0 = 2'b00,
					s1 = 2'b01,
					s2 = 2'b10,
					s3 = 2'b11;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					count <= 0;
					led <= 4'b1111;
					state <= s0;
				end
			else
				begin
					case (state)
					s0	:	begin
								if (count < T1s - 1)
									begin
										count <= count + 1;
										led <= 4'b1000;
										state <= s0;
									end
								else
									begin
										count <= 0;
										state <= s1;
									end
							end
					
					s1	:	begin
								if (count < T1s - 1)
									begin
										count <= count + 1;
										led <= 4'b0100;
										state <= s1;
									end
								else
									begin
										count <= 0;
										state <= s2;
									end
							end
					
					s2	:	begin
								if (count < T1s - 1)
									begin
										count <= count + 1;
										led <= 4'b0010;
										state <= s2;
									end
								else
									begin
										count <= 0;
										state <= s3;
									end
							end
					
					s3	:	begin
								if (count < T1s - 1)
									begin
										count <= count + 1;
										led <= 4'b0001;
										state <= s3;
									end
								else
									begin
										count <= 0;
										state <= s0;
									end
							end
					
					default	:	state <= s0;
					
					endcase
				end
		end

endmodule
