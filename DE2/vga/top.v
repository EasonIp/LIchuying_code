module top (clk, rst_n, r, g, b, hsync, vsync, VGA_CLK, VGA_BLANK, VGA_SYNC);

	input clk, rst_n;
	
	output [9:0] r, g, b;
	output hsync, vsync;
	output VGA_CLK;
	output VGA_BLANK, VGA_SYNC;
	
	assign VGA_BLANK = 1'b1;
	assign VGA_SYNC = 1'b0;
	
	wire [29:0] rgb30;	

	pll pll (.areset(~rst_n), .inclk0(clk), .c0(VGA_CLK));		// VGA_CLK is 40M clock

	vga vga (.clk(VGA_CLK), .rst_n(rst_n), .rgb30(rgb30), .hsync(hsync), .vsync(vsync));
	
	rgb rgb (.rgb30(rgb30), .r(r), .g(g), .b(b));

endmodule
