`timescale 1ns/1ps

module ps2_tb;

	reg clk, rst_n;
	reg ps2_clk;
	reg ps2_data_in;
	
	wire [7:0] ps2_data_out;
	wire valid;
	
	ps2 dut 
		(
			.clk(clk), 
			.rst_n(rst_n), 
			.ps2_clk(ps2_clk), 
			.ps2_data_in(ps2_data_in), 
			.ps2_data_out(ps2_data_out), 
			.valid(valid)
		);

	initial 
		begin
			clk = 1;
			rst_n = 0;
			ps2_clk = 1;
			ps2_data_in = 1;
			#200.1
			rst_n = 1;
			
			#60	ps2_data_in = 0;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//start bit
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d0, d=8'h69, num=1
			#60	ps2_data_in = 0;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d1
			#60	ps2_data_in = 0;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d2
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d3
			#60	ps2_data_in = 0;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d4
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d5
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d6
			#60	ps2_data_in = 0;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d7
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//parity bit
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//stop bit
			#2000
			#60	ps2_data_in = 0;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//start bit
			#60	ps2_data_in = 0;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d0, d=8'hF0, num=1
			#60	ps2_data_in = 0;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d1
			#60	ps2_data_in = 0;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d2
			#60	ps2_data_in = 0;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d3
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d4
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d5
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d6
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d7
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//parity bit
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//stop bit
			#2000
			#60	ps2_data_in = 0;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//start bit
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d0, d=8'h69, num=1
			#60	ps2_data_in = 0;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d1
			#60	ps2_data_in = 0;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d2
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d3
			#60	ps2_data_in = 0;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d4
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d5
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d6
			#60	ps2_data_in = 0;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//d7
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//parity bit
			#60	ps2_data_in = 1;	#60	ps2_clk = 0;	#120	ps2_clk = 1;		//stop bit
			
			#2000 $stop;
		end

	always #10 clk = ~clk;

endmodule
