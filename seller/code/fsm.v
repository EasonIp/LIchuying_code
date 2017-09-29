module fsm (clk, rst_n, flag_money, flag_coin, t_rst_n, t_end, led_idle_rst_n, 
				led1_rst_n, led2_rst_n, led3_rst_n, led4_rst_n, led_flash_rst_n, led_pulse_rst_n);

	input clk, rst_n, flag_money, flag_coin, t_end; 
	
	output reg t_rst_n;
	output reg led_idle_rst_n, led1_rst_n, led2_rst_n, led3_rst_n, led4_rst_n, led_flash_rst_n, led_pulse_rst_n;
	
	reg [7:0] state;
	
	localparam 	S0 = 0,
					S1 = 1,
					S2 = 2,
					S3 = 3,
					S4 = 4,
					S5 = 5,
					S6 = 6;

	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					led_idle_rst_n <= 1;
					led1_rst_n <= 1;
					led2_rst_n <= 1;
					led3_rst_n <= 1;
					led4_rst_n <= 1;
					led_flash_rst_n <= 1;
					led_pulse_rst_n <= 1;
					t_rst_n <= 1;
					state <= S0;
				end
			else 
				begin
					case (state)
					S0	:	begin   									// led_idle
								if (flag_coin)
									begin
										led_idle_rst_n <= 1;
										state <= S1;
									end
								else if (flag_money)
									begin
										led_idle_rst_n <= 1;
										state <= S2;
									end
								else
									begin
										led_idle_rst_n <= 0;
										state <= S0;
									end
							end
					
					S1	:	begin   									// led1
								if (flag_coin)
									begin
										led1_rst_n <= 1;
										state <= S2;
									end
								else if (flag_money)
									begin
										led1_rst_n <= 1;
										state <= S3;
									end
								else
									begin
										led1_rst_n <= 0;
										state <= S1;
									end
							end
					
					S2	:	begin   									// led2
								if (flag_coin)
									begin
										led2_rst_n <= 1;
										state <= S3;
									end
								else if (flag_money)
									begin
										led2_rst_n <= 1;
										state <= S4;
									end
								else
									begin
										led2_rst_n <= 0;
										state <= S2;
									end
							end
					
					S3	:	begin   									// led3
								if (flag_coin)
									begin
										led3_rst_n <= 1;
										state <= S4;
									end
								else if (flag_money)
									begin
										led3_rst_n <= 1;
										state <= S5;
									end
								else
									begin
										led3_rst_n <= 0;
										state <= S3;
									end
							end
					
					S4	:	begin   									// led4
								if (flag_coin)
									begin
										led4_rst_n <= 1;
										state <= S5;
									end
								else if (flag_money)
									begin
										led4_rst_n <= 1;
										state <= S6;
									end
								else
									begin
										led4_rst_n <= 0;
										state <= S4;
									end
							end
					
					S5	:	begin   									// led5
								if (t_end)
									begin
										led_pulse_rst_n <= 1;
										t_rst_n <= 1;
										state <= S0;
									end
								else
									begin
										led_pulse_rst_n <= 0;
										t_rst_n <= 0;
										state <= S5;
									end
							end

					S6	:	begin   									// led6
								if (t_end)
									begin
										led_flash_rst_n <= 1;
										t_rst_n <= 1;
										state <= S5;
									end
								else
									begin
										led_flash_rst_n <= 0;
										t_rst_n <= 0;
										state <= S6;
									end
							end

					default	:	begin
										led_idle_rst_n <= 1;
										led1_rst_n <= 1;
										led2_rst_n <= 1;
										led3_rst_n <= 1;
										led4_rst_n <= 1;
										led_flash_rst_n <= 1;
										led_pulse_rst_n <= 1;
										t_rst_n <= 1;
										state <= S0;
									end
									
					endcase
				end
		end	

endmodule
