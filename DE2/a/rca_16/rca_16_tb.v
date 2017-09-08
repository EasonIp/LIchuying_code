`timescale 1ns/1ps

module rca_16_tb;

	reg [15:0] a, b;
	reg c_in;
	wire [15:0] sum;
	wire c_out;
	integer i;

	rca_16 dut(.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));
	
	initial begin
		a = 0; b = 0; c_in = 0;
		
		for (i=0; i<65536; i=i+1) begin  
			#10 a = i; b = i; c_in = 0;
			#10 a = i; b = i; c_in = 1;
		end
	
		for (i=0; i<65536; i=i+1) begin  
			#10 a = i; b = i; c_in = 0;
			#10 a = i; b = i; c_in = 1;
		end

		#200 $stop;
	end

endmodule

