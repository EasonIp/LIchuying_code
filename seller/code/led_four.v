module led_four(clk, rst_n, pio_led);

	input clk, rst_n;
	
	output reg [3:0] pio_led;

	always @ (posedge clk or negedge rst_n)
	begin
		if (!rst_n)
			begin
				pio_led <= 4'b1111;
			end
		else
			pio_led <= 4'b0000;
	end	

endmodule
