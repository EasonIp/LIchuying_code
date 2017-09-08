module dds (clk, rst_n, num);

	input clk, rst_n;
	
	output [7:0] num;
	
	wire [7:0] addr;
	
	control #(.pword(64), .fword(1_000_000))
		control_inst(
				.clk(clk), 
				.rst_n(rst_n), 
				.addr(addr)
			);

	rom	rom_inst (
		.address ( addr ),
		.clock ( clk ),
		.q ( num )
		);

endmodule
