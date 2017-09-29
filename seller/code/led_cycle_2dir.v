module led_cycle_2dir(clk, rst_n, flag1, flag2, pio_led);

	input clk, rst_n, flag1, flag2;
	
	output reg [3:0] pio_led;
	
	reg [2:0] state;
	reg [31:0] count;
	
	parameter CNT = 25_000_000;		// 0.5s
	
	always @ (posedge clk or negedge rst_n)
	begin
		if (!rst_n)
			begin
				pio_led <= 4'b1111;
				state <= 0;
				count <= 0;
			end
		else
			begin
				case (state)
					0	:	begin
								pio_led <= 4'b1110;
								if (flag1)
										state <= 1;
								else if (flag2)
										state <= 2;
								else
										state <= 0;
							end

					1	:	begin
								if (flag2)
									begin 
										count <= 0;
										state <= 2;
									end
								else
									begin
										if (count < CNT - 1)
											begin
												count <= count + 1;
												pio_led <= pio_led;
											end
										else
											begin
												count <= 0;
												pio_led <= {pio_led[2:0], pio_led[3]};
											end
									end
							end
							
					2	:	begin
								if (flag1)
									begin 
										count <= 0;
										state <= 1;
									end
								else
									begin
										if (count < CNT - 1)
											begin
												count <= count + 1;
												pio_led <= pio_led;
											end
										else
											begin
												count <= 0;
												pio_led <= {pio_led[0], pio_led[3:1]};
											end
									end
							end
					
					default	:	begin
										pio_led <= 4'b1110;
										state <= 1;
									end
				endcase
			end
	end

endmodule
