module vga_zx (clk, rst_n, rgb30, hsync, vsync);

	input clk, rst_n;
	
	output [29:0] rgb30;
	output hsync, vsync;

	reg [31:0] hcnt, vcnt;
	wire hflag, vflag;

	// 800*600*60  40.0MHz=1056(128+88+800+40) * 628(4+23+600+1) * 60Hz
	parameter	ha = 128,	hb = 88,	hc = 800,	hd = 40,	he = 1056;
	parameter	va = 4,		vb = 23,	vc = 600,	vd = 1,		ve = 628;
					
	localparam	hab = ha + hb,	hac = ha + hb + hc;
	localparam	vab = va + vb,	vac = va + vb + vc;
	localparam	dh = 200, dv = 200;

	wire [5:0] addr;
	wire [7:0] q;

	rom64_zx rom64_zx (
			.address(addr),
			.clock(clk),
			.q(q)
		);

	wire [9:0] i;
	wire [9:0] j;

	assign i = ((hcnt+1-hab-dh)>>3) & 5'b11111;		// % 32
	assign j = ((vcnt-vab-dv)>>3) & 4'b1111;		// % 16

	assign addr = ((j<<5) + i)>>3;		// addr = (j*32+i)/8

	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					hcnt <= 0;
					vcnt <= 0;
				end
			else
				begin
					if ((vcnt==ve-1) && (hcnt==he-1))
						begin
							hcnt <= 0;
							vcnt <= 0;
						end
					else
						begin
							if (hcnt==he-1)
								begin
									hcnt <= 0;
									vcnt <= vcnt + 1;
								end
							else
								hcnt <= hcnt + 1;
						end
				end
		end
		
	assign hsync = (hcnt < ha) ? 1'b0 : 1'b1;
	assign vsync = (vcnt < va) ? 1'b0 : 1'b1;
	
	assign hflag = ((hcnt>=hab) && (hcnt<hac)) ? 1'b1 : 1'b0;
	assign vflag = ((vcnt>=vab) && (vcnt<vac)) ? 1'b1 : 1'b0;
	
	wire [29:0] block;
	
//	assign block = {{10{1'b1}},10'b0,10'b0};			// red only
//  for r:g:b = 1:1:1
//	assign block = (vcnt-vab<200) ? {{10{1'b1}},10'b0,10'b0} : (vcnt-vab<400) ? {10'b0,{10{1'b1}},10'b0} : {10'b0,10'b0,{10{1'b1}}};
//  for vga_zxzx
//	assign block = q[((hcnt-hab)>>3) & 3'b111] ? {30{1'b1}} : {10'b0,10'b0,{1'b1,9'b0}};

	wire hblock, vblock;
	assign hblock = ((hcnt>=hab+dh) && (hcnt<hab+dh+256)) ? 1'b1 : 1'b0;
	assign vblock = ((vcnt>=vab+dv) && (vcnt<vab+dv+128)) ? 1'b1 : 1'b0;
	assign block = (hblock && vblock && q[((hcnt-hab-dh)>>3) & 3'b111]) ? {30{1'b1}} : {10'b0,10'b0,{1'b1,9'b0}};
	
	assign rgb30 = (hflag && vflag) ? block : 30'b0;

endmodule
