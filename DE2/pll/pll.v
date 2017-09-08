module pll (clk, rst_n, clk_25M, clk_100M, locked);

	input clk, rst_n;
	
	output clk_25M, clk_100M;
	output locked;
	
	my_pll	my_pll_inst (
		.areset ( ~rst_n ),
		.inclk0 ( clk ),
		.c0 ( clk_25M ),
		.c1 ( clk_100M ),
		.locked ( locked )
		);

endmodule
