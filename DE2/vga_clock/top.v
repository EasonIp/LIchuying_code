module top (clk, rst_n, r, g, b, hsync, vsync, VGA_CLK, VGA_BLANK, VGA_SYNC);

	input clk, rst_n;
	
	output [9:0] r, g, b;
	output hsync, vsync;
	output VGA_CLK;
	output VGA_BLANK, VGA_SYNC;
	
	assign VGA_BLANK = 1'b1;
	assign VGA_SYNC = 1'b0;
	
	wire [29:0] rgb30;	

	wire [31:0] data, data_clk;

	clock_controller  #(.T10ms(250000))
		clock_controller_inst (.clk(clk), .rst_n(rst_n), .data(data));

	b2bcd_99 b2bcd_99_inst1 (.din(data[31:24]), .dout(data_clk[31:24])); 
	b2bcd_99 b2bcd_99_inst2 (.din(data[23:16]), .dout(data_clk[23:16])); 
	b2bcd_99 b2bcd_99_inst3 (.din(data[15: 8]), .dout(data_clk[15: 8])); 
	b2bcd_99 b2bcd_99_inst4 (.din(data[ 7: 0]), .dout(data_clk[ 7: 0])); 

	pll pll (.areset(~rst_n), .inclk0(clk), .c0(VGA_CLK));		// VGA_CLK is 40M clock

//	vga vga (.clk(VGA_CLK), .rst_n(rst_n), .rgb30(rgb30), .hsync(hsync), .vsync(vsync));
//	vga_zxzx vga_zxzx (.clk(VGA_CLK), .rst_n(rst_n), .rgb30(rgb30), .hsync(hsync), .vsync(vsync));
//	vga_zx vga_zx (.clk(VGA_CLK), .rst_n(rst_n), .rgb30(rgb30), .hsync(hsync), .vsync(vsync));
	vga_data8 vga_data8 (.clk(VGA_CLK), .rst_n(rst_n), .data8(data_clk), .rgb30(rgb30), .hsync(hsync), .vsync(vsync));
	
	rgb rgb (.rgb30(rgb30), .r(r), .g(g), .b(b));

endmodule
