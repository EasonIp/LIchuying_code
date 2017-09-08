module rom (clk, rst_n, q);

	input clk, rst_n;
	
	output [7:0] q;
	
	wire [7:0] addr;

	rom_controller rom_controller_inst(
			.clk(clk), 
			.rst_n(rst_n), 
			.addr(addr)
		);
	
	my_rom	my_rom_inst (
			.address ( addr ),
			.clock ( clk ),
			.q ( q )
		);

endmodule
