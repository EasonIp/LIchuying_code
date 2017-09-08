`timescale 1ns/1ps

module and_gate_tb;

	reg clk, rst_n;
	reg a, b;
	
	wire f;
	
	and_gate  dut (.clk(clk), .rst_n(rst_n), .a(a), .b(b), .f(f));
	
	initial 
		begin
			clk = 1;
			rst_n = 0;
			a = 0;
			b = 0;
			
			#200.1
			rst_n = 1;
			
			forever
				begin
					#20	a = 0;	b = 0;
					#20	a = 0;	b = 1;
					#20	a = 1;	b = 0;
					#20	a = 1;	b = 1;
				end
		end
	
	initial #1000 $stop;

	always #10 clk = ~clk;
	
endmodule
