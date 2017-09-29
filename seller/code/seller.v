module seller (clk, rst_n, money, coin, pio_led);

	input clk, rst_n;
	input money, coin;
	
	output [3:0] pio_led;

//-------------------------	

	wire flag_money, flag_coin;  // money = 1 yuan, coin = 0.5 yuan 
	
//	key	#(.T20ms(20))	key1(.clk(clk), .rst_n(rst_n), .keyin_n(money), .key_flag(key_flag));
	key key_money (.clk(clk), .rst_n(rst_n), .keyin_n(money), .key_flag(flag_money));
	key key_coin  (.clk(clk), .rst_n(rst_n), .keyin_n(coin), .key_flag(flag_coin));

//-------------------------	

	wire t_rst_n, t_end, led_idle_rst_n, led1_rst_n, led2_rst_n, led3_rst_n, led4_rst_n, led_flash_rst_n, led_pulse_rst_n;
	
	fsm	fsm1(.clk(clk), .rst_n(rst_n), .flag_money(flag_money), .flag_coin(flag_coin), .t_rst_n(t_rst_n), .t_end(t_end), .led_idle_rst_n(led_idle_rst_n), .led1_rst_n(led1_rst_n), .led2_rst_n(led2_rst_n), .led3_rst_n(led3_rst_n), .led4_rst_n(led4_rst_n), .led_flash_rst_n(led_flash_rst_n), .led_pulse_rst_n(led_pulse_rst_n));
	
//	timer #(.PULSE_CNT(20)) timer1(.clk(clk), .rst_n(rst_n), .t_rst_n(t_rst_n), .t_end(t_end));
	timer  timer1(.clk(clk), .rst_n(rst_n), .t_rst_n(t_rst_n), .t_end(t_end));
	
//-------------------------	
		
	led_out	led1(.clk(clk), .rst_n(rst_n), .led_idle_rst_n(led_idle_rst_n), .led1_rst_n(led1_rst_n), .led2_rst_n(led2_rst_n), .led3_rst_n(led3_rst_n), .led4_rst_n(led4_rst_n), .led_flash_rst_n(led_flash_rst_n), .led_pulse_rst_n(led_pulse_rst_n), .pio_led(pio_led));

endmodule
