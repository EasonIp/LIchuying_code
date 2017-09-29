module led_out (clk, rst_n, led_idle_rst_n, led1_rst_n, led2_rst_n, led3_rst_n, led4_rst_n, 
					led_flash_rst_n, led_pulse_rst_n, pio_led);

	input clk, rst_n;
	input led_idle_rst_n, led1_rst_n, led2_rst_n, led3_rst_n, led4_rst_n, led_flash_rst_n, led_pulse_rst_n;
	
	output [3:0] pio_led;
	
	wire [3:0] led_idle_out, led1_out, led2_out, led3_out, led4_out, led_flash_out, led_pulse_out;

	led_cycle_2dir led_idle1 	(.clk(clk), .rst_n(rst_n), .flag1(1), .flag2(0),.pio_led(led_idle_out));
	led_one 			led_one1 	(.clk(clk), .rst_n(rst_n), .pio_led(led1_out));
	led_two 			led_two1		(.clk(clk), .rst_n(rst_n), .pio_led(led2_out));
	led_three 		led_three1	(.clk(clk), .rst_n(rst_n), .pio_led(led3_out));
	led_four 		led_four1	(.clk(clk), .rst_n(rst_n), .pio_led(led4_out));
	flash 			led_flash1	(.clk(clk), .rst_n(rst_n), .pio_led(led_flash_out));
	pulse 			led_pulse1	(.clk(clk), .rst_n(rst_n), .pio_led(led_pulse_out));
	
	wire [7:0] sel_n;
	assign sel_n = {led_idle_rst_n, led1_rst_n, led2_rst_n, led3_rst_n, led4_rst_n, led_flash_rst_n, led_pulse_rst_n};

	led_mux led_mux1 (.clk(clk), .rst_n(rst_n), .sel_n(sel_n), .led_idle_in(led_idle_out), .led1_in(led1_out), 
			.led2_in(led2_out), .led3_in(led3_out), .led4_in(led4_out), .led_flash_in(led_flash_out), 
			.led_pulse_in(led_pulse_out), .pio_led(pio_led));

endmodule
