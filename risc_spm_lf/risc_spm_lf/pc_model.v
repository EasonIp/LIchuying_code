`include "spm_head.v"

module pc_model(clk, rst_n, load_pc, inc_pc, pc_in, pc_out);

	input clk, rst_n;
	input load_pc, inc_pc;
	input [7:0] pc_in;
	output reg [7:0] pc_out;

	always @ (posedge clk)
	begin
		if (!rst_n)
			pc_out <= `RESET_VECTOR;
		else if (load_pc)	
			pc_out <= pc_in;
		else if (inc_pc)
			pc_out <= pc_out + 8'h1;
	end

endmodule
