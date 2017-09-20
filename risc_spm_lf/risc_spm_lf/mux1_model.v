`include "spm_head.v"

module mux1_model(r0, r1, r2, r3, pc, sel_mux1, bus1);

	input [7:0] r0, r1, r2, r3, pc;
	input [2:0] sel_mux1;
	output reg [7:0] bus1;
	
	always @ (*)
	begin
		case (sel_mux1)
			`SEL_MUX1_R0 : bus1 = r0;
			`SEL_MUX1_R1 : bus1 = r1;
			`SEL_MUX1_R2 : bus1 = r2;
			`SEL_MUX1_R3 : bus1 = r3;
			`SEL_MUX1_PC : bus1 = pc;
			default 		 : bus1 = pc;   
		endcase
	end

endmodule
