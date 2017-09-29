module key(clk, rst_n, keyin_n, key_flag);

	input clk, rst_n;
	input keyin_n;

	output reg key_flag;
	
	parameter T20ms = 1_000_000;		// 20ns / 20ns = 1_000_000
	
	reg [31:0] count;
	reg state;
//	reg key_release;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					count <= 0;
					key_flag <= 0;
//					key_release <= 0;
					state <= 0;
				end
			else
				begin
					case (state)
					0	:	begin
//								key_release <= 0;
								if (keyin_n)
									count <= 0;
								else 
									begin
										if (count < T20ms - 1)
											count <= count + 1;
										else	
											begin
												count <= 0;
												key_flag <= 1;
												state <= 1;
											end
									end
							end
							
					1	:	begin
								key_flag <= 0;
								if (!keyin_n)
									count <= 0;
								else 
									begin
										if (count < T20ms - 1)
											count <= count + 1;
										else	
											begin
												count <= 0;
//												key_release <= 1;
												state <= 0;
											end
									end
							end

					default	:	state <= 0;
					
					endcase
				end	
		end

endmodule 