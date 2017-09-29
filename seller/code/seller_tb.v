`timescale 1ns/1ps

module seller_tb;

	reg clk, rst_n, money;

	wire pio_led;

	seller  dut(.clk(clk), .rst_n(rst_n), .money(money), .pio_led(pio_led));
	
	initial begin
		clk = 1;
		rst_n = 0;
		money = 1;
		#200.1	rst_n = 1;

		#100			money = 0;
		#40 			money = 1;
		#40			money = 0;
		#40 			money = 1;
		#40			money = 0;
		#1000 		money = 1;

		#100			money = 0;
		#40 			money = 1;
		#40			money = 0;
		#40 			money = 1;
		#1000			money = 0;
		#1000 		money = 1;

		#100			money = 0;
		#40 			money = 1;
		#40			money = 0;
		#40 			money = 1;
		#1000			money = 0;
		#1000 		money = 1;

		#100			money = 0;
		#40 			money = 1;
		#40			money = 0;
		#40 			money = 1;
		#1000			money = 0;
		#1000 		money = 1;

		#1000		$stop;
	
	end

	always #10 clk = ~clk;

endmodule

