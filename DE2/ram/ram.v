module ram (clk, rst_n, q);

	input clk, rst_n;
	
	output [7:0] q;
	
	wire wren;
	wire [7:0] addr;
	wire [7:0] data;

	ram_controller ram_controller_inst (
			.clk(clk), 
			.rst_n(rst_n), 
			.wren(wren), 
			.addr(addr), 
			.data(data)
		);
	
	my_ram	my_ram_inst (
			.address ( addr ),
			.clock ( clk ),
			.data ( data ),
			.wren ( wren ),
			.q ( q )
		);

endmodule
