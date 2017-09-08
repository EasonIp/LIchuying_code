module divider2 (clk, rst_n, clk_out);

	input clk, rst_n;
	
	output clk_out;

	parameter WIDTH = 5;			// WIDTH = 3
	
	wire out_clk_1;
	reg out_clk_2;
	
	div_freq #(.HW(WIDTH>>1), .LW((WIDTH+1)>>1)) 
		d1 (.clk(clk), .rst_n(rst_n), .clk_out(out_clk_1));
		
	always @ (negedge clk or negedge rst_n)
		begin
			if (!rst_n)
				out_clk_2 <= out_clk_1;
			else
				out_clk_2 <= out_clk_1;
		end
					
	assign clk_out = (WIDTH & 1'b1) ? (out_clk_1 || out_clk_2) : out_clk_1;

endmodule
