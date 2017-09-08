module rom_controller (clk, rst_n, addr);

	input clk, rst_n;
	
	output reg [7:0] addr;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				addr <= 0;
			else
				begin
					if (addr <255)
						addr <= addr + 8'd1;
					else
						addr <= 0;
				end
		end

endmodule
