module led_mux(clk, rst_n, sel_n, led_idle_in, led1_in, led2_in, led3_in, led4_in, 
					led_flash_in, led_pulse_in, pio_led);

	input clk, rst_n;
	input [3:0] led_idle_in, led1_in, led2_in, led3_in, led4_in, led_flash_in, led_pulse_in; 
	input [7:0] sel_n;
	
	output reg [3:0] pio_led;

	always @ (posedge clk or negedge rst_n)
	begin
		if (!rst_n)
			pio_led <= 4'b1111;
		else 
			begin
				case (sel_n)
				7'b0111111	:	pio_led <= led_idle_in;
				7'b1011111	:	pio_led <= led1_in;
				7'b1101111	:	pio_led <= led2_in;
				7'b1110111	:	pio_led <= led3_in;
				7'b1111011	:	pio_led <= led4_in;
				7'b1111101	:	pio_led <= led_flash_in;
				7'b1111110	:	pio_led <= led_pulse_in;
				default	:	pio_led <= 4'b1111;
				endcase
			end
	end	

endmodule
