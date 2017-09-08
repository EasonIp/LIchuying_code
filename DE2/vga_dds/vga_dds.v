module vga_dds (clk, rst_n, key_out, wave, rgb30, hsync, vsync);

	input clk, rst_n;
	input [1:0] key_out;
	input [7:0] wave;
	
	output [29:0] rgb30;
	output hsync, vsync;

	reg [31:0] hcnt, vcnt;
	wire hflag, vflag;

	// 800*600*60  40.0MHz=1056(128+88+800+40) * 628(4+23+600+1) * 60Hz
	parameter	ha = 128,	hb = 88,	hc = 800,	hd = 40,	he = 1056;
	parameter	va = 4,		vb = 23,	vc = 600,	vd = 1,		ve = 628;
					
	localparam	hab = ha + hb,	hac = ha + hb + hc;
	localparam	vab = va + vb,	vac = va + vb + vc;

	wire [9:0] addr;
	wire [7:0] q;
	wire wren;
	
	ram800_wave	ram800_wave (
			.address ( addr ),
			.clock ( clk ),
			.data ( wave ),
			.wren ( wren ),
			.q ( q )
		);

	assign addr = hcnt+1-hab;		// addr = hcnt+1-hab

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
	
//	wire hblock, vblock;
//	assign hblock = ((hcnt>=hab) && (hcnt<hac)) ? 1'b1 : 1'b0;
//	assign vblock = ((vcnt>=vab+300-128) && (vcnt<vab+300+128)) ? 1'b1 : 1'b0;

	wire [29:0] block;
	assign block = (q[7:1] == (vcnt-(vab+300-128))>>1) ? {30{1'b1}} : {10'b0,10'b0,{1'b1,9'b0}};
//	assign block = (hblock && vblock && (q[7:2] == (vcnt-(vab+300-128))>>2)) ? {30{1'b1}} : {10'b0,10'b0,{1'b1,9'b0}};
	
	reg frame1_p, frame1;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					frame1_p <= 1'b1;
					frame1 <= 1'b0;
				end
			else
				begin
					if (key_out[0] || key_out[1])
						frame1_p <= 1'b1;
					else
						begin
							if ((hcnt==0) && (vcnt==0) && (frame1_p==1'b1))
								begin
									if (frame1==0)
										frame1 <= 1'b1;
									else
										begin
											frame1_p <= 1'b0;
											frame1 <= 1'b0;
										end
								end
							else
								frame1 <= frame1;
						end
				end
		end
	
	
	assign wren = (frame1 && (vcnt==3) && (hcnt>=hab-1) && (hcnt<hac)) ? 1'b1 : 1'b0;
	
	assign rgb30 = (hflag && vflag && (vcnt!=vab+300)) ? block : 30'b0;

endmodule
