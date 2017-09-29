module flash(clk, rst_n, pio_led);

	input clk, rst_n;

	output[3:0] pio_led;
	
	reg [31:0] count1;   // count
	reg flag1, pwm;
	
	parameter CNT1S = 50_000_000 - 1; //1s/1us, 50M-1
	
	
	always @ (posedge clk or negedge rst_n)
	begin
		if (!rst_n)
			begin
				flag1 <= 0;
				count1 <= 0;
			end
		else
			begin
				if (count1 < CNT1S)
					begin
						count1 <= count1 + 1;
						flag1 <= 0;
					end
				else
					begin
						count1 <= 0;
						flag1 <= 1;
					end
			end
	end

	always @ (posedge clk or negedge rst_n)
	begin
		if (!rst_n)
			begin
				pwm <= 0;
			end
		else if (flag1)
			pwm <= ~pwm;
		else
			pwm <= pwm;
	end
	
	assign pio_led = {4{pwm}};
	
endmodule
