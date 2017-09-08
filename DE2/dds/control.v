module control (clk, rst_n, addr);

	input clk, rst_n;
	
	output [7:0] addr;
	
	parameter pword = 0;		// phase control word
	parameter fword = 1;		// frequency control word
	
	reg [31:0] addr_cnt;		// address counter
	
	assign addr = addr_cnt[31:24];
	
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					addr_cnt[31:24] <= pword;
					addr_cnt[23:0] <= 24'd0;
				end
			else
				addr_cnt <= addr_cnt + fword;
		end

endmodule
