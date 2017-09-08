`timescale 1ns/1ps

module andgate_tb;

	reg a, b;
	
	wire f;
	
	andgate dut (.a(a), .b(b), .f(f));

	initial
		begin
			a = 0; b = 0;
			
			forever
				begin
					#10 a = 0; b = 0;
					#10 a = 0; b = 1;
					#10 a = 1; b = 0;
					#10 a = 1; b = 1;
				end
		end

	initial #1000 $stop;

endmodule
