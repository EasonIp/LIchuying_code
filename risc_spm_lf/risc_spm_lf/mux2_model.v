`include "spm_head.v"

module mux2_model(alu_out, bus1, m_out, sel_mux2, bus2);

	input [7:0] alu_out, bus1, m_out;
	input [1:0] sel_mux2;
	output reg [7:0] bus2;
	
	always @ (*)
	begin
		case (sel_mux2)
			`SEL_MUX2_ALU  : bus2 = alu_out;
			`SEL_MUX2_BUS1 : bus2 = bus1;
			`SEL_MUX2_MEM  : bus2 = m_out;
			default			: bus2 = bus1;	
		endcase
	end

endmodule
