`timescale 1ns/1ps

module key_pad_tb;

	reg clk, rst_n;
	reg [3:0] row;
	
	wire [3:0] col;
	wire [3:0] data;
	wire flag;

	reg [4:0] key;
	
	key_pad #(.T1ms(50), .NUM_KEY(20))
		dut (.clk(clk), .rst_n(rst_n), .col(col), .row(row), .data(data), .flag(flag));
		
	initial
		begin
			clk = 1;
			rst_n = 0;
			key = 5'h10;
			row = 4'b1111;
			#200.1
			rst_n = 1;
			key = 5'h09;
			#25_000
			key = 5'h10;
			#50_000
			
			key = 5'h0A;
			#30_000
			key = 5'h10;
			#50_000

			key = 5'h0B;
			#45_000
			key = 5'h10;
			#50_000
			
			$stop;
		end
		
	always @ (*)
		begin
			case (key)
			5'h10	:	row = 4'b1111;				// no key pressed
			5'h00	:	row = {1'b1, 1'b1, 1'b1, col[0]};
			5'h01	:	row = {1'b1, 1'b1, 1'b1, col[1]};
			5'h02	:	row = {1'b1, 1'b1, 1'b1, col[2]};
			5'h03	:	row = {1'b1, 1'b1, 1'b1, col[3]};
			5'h04	:	row = {1'b1, 1'b1, col[0], 1'b1};
			5'h05	:	row = {1'b1, 1'b1, col[1], 1'b1};
			5'h06	:	row = {1'b1, 1'b1, col[2], 1'b1};
			5'h07	:	row = {1'b1, 1'b1, col[3], 1'b1};
			5'h08	:	row = {1'b1, col[0], 1'b1, 1'b1};
			5'h09	:	row = {1'b1, col[1], 1'b1, 1'b1};
			5'h0A	:	row = {1'b1, col[2], 1'b1, 1'b1};
			5'h0B	:	row = {1'b1, col[3], 1'b1, 1'b1};
			5'h0C	:	row = {col[0], 1'b1, 1'b1, 1'b1};
			5'h0D	:	row = {col[1], 1'b1, 1'b1, 1'b1};
			5'h0E	:	row = {col[2], 1'b1, 1'b1, 1'b1};
			5'h0F	:	row = {col[3], 1'b1, 1'b1, 1'b1};
			default	:	row = 4'b1111;				// no key pressed
			endcase
		end

	always #10 clk = ~clk;


endmodule
