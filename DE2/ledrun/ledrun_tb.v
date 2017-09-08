`timescale 1ns/1ps

module ledrun_tb;

	reg clk, rst_n;
	
	wire [3:0] led;

//	parameter T1s = 5;
//	ledrun dut(.clk(clk), .rst_n(rst_n), .led(led));
	ledrun #(.T1s(5)) dut(.clk(clk), .rst_n(rst_n), .led(led));

	initial
		begin
			clk = 1;
			rst_n = 0;
			#200.1
			rst_n = 1;
			
			#2000 $stop;
		end

	always #10 clk = ~clk;

endmodule
