`timescale 1ns/1ps

module iic_noack_tb;

	reg clk, rst_n;
	reg key_rd, key_wr;
	reg [7:0] data_in;
	
	wire [7:0] data_out;
	wire scl;
	
	wire sda;
	
	iic_noack dut 
		(
			.clk(clk), 
			.rst_n(rst_n), 
			.key_rd(key_rd), 
			.key_wr(key_wr), 
			.data_in(data_in), 
			.data_out(data_out), 
			.scl(scl), 
			.sda(sda)
		);
		
	initial 
		begin
			clk = 1;
			rst_n = 0;
			key_rd = 1;
			key_wr = 1;
			data_in = 0;
			#200.1
			rst_n = 1;
			#8000
			key_wr = 0;
			data_in = 8'h23;
			#40_000
			key_wr = 1;
			
			#1000_000
			key_rd = 0;
			#40_000
			key_wr = 1;
			
			#1000_000
			$stop;
		end
	
	always #10 clk = ~clk;

endmodule
