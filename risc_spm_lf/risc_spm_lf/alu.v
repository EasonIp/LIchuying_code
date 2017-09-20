`include "spm_head.v"

module alu(x, y, instr, alu_z_fla, alu_out);

	input [7:0] x, y;
	input [7:0] instr;
	output alu_z_fla;
	output reg [7:0] alu_out;
	
	always @ (*)
	begin
		case (instr[7:4])
			`ADD	:	alu_out = x + y;
			`SUB	:	alu_out = x - y;
			`AND	:	alu_out = x & y;
			`NOT	:	alu_out = ~y;
			`NOP	:	alu_out = 8'h0;	//可能会影响零标志位
			default : alu_out = 8'h0;
		endcase
	end

	assign alu_z_fla = ~|alu_out;

endmodule

