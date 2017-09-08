module post_seg7 (sel, seg_o, seg);

	input [2:0] sel;
	input [7:0] seg_o;
	
	output reg [7:0] seg;
	
	always @ (*)
		begin
			case (sel)
			0	:	seg = 8'b1111_1111;				// null
			1	:	seg = 8'b1111_1111;				// null
			2	:	seg = {1'b0, seg_o[6:0]};		// add decimal point
			default	:	seg = seg_o;
			endcase
		end

endmodule
