module vga(clk, rst_n, r, g, b, hsync, vsync);

	input clk, rst_n;
	
	output [2:0] r, g;
	output [1:0] b;
	output hsync, vsync;
	
	wire [7:0] en;
	
	pll p1(.areset(!rst_n), .inclk0(clk), .c0(clk_40M));
	
//	vga_driver d1(.clk(clk_40M), .rst_n(rst_n), .en(en), .hsync(hsync), .vsync(vsync));
	vga_driver3 d3(.clk(clk_40M), .rst_n(rst_n), .en(en), .hsync(hsync), .vsync(vsync));
//	vga_driver4 d4(.clk(clk_40M), .rst_n(rst_n), .en(en), .hsync(hsync), .vsync(vsync));
//	vga_driver4_move d4m(.clk(clk_40M), .rst_n(rst_n), .en(en), .hsync(hsync), .vsync(vsync));
	
	rgb rgb1(.en(en), .r(r), .g(g), .b(b));
	

endmodule
