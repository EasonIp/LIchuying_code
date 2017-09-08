`timescale 1ns/1ns

module spi_write (CLK,SPC,SDAT,regdata,GO,ORDY,reset,SCEN);

	input CLK;
	input GO;
	input reset;
	input [15:0] regdata;
	
	inout SDAT;
	
	output SPC;
	output SCEN;
	output ORDY;
	
	reg [15:0] Q;
	reg [3:0] bitcount;
	wire LDEN, SHEN, rstbitcount;
	wire bitcountEN;
	wire SCLK;

	spi_three_wire spi0 (
			.reset(reset),
			.CLK(CLK),
			.GO(GO),
			.bitcount(bitcount),
			.bitcountEN(bitcountEN),
			.rstbitcount(rstbitcount),
			.LDEN(LDEN),
			.SHEN(SHEN),
			.SCLK(SCLK),
			.SCEN(SCEN),
			.ORDY(ORDY),
			.SPC(SPC)
		);
	
	always @ (posedge CLK or posedge reset)
		begin
			if (reset)
				bitcount <= 0;
			else
				begin
					if (rstbitcount)
						bitcount <= 0;
					else
						begin
							if (bitcountEN)
								bitcount <= bitcount + 4'd1;
						end
				end
		end
		
	always @ (posedge CLK or posedge reset)
		begin
			if (reset)
				Q <= 0;
			else
				begin
					if (LDEN)
						Q <= regdata;
					else
						begin
							if (SHEN)
								Q <= {Q[14:0], 1'b0};
						end
				end
		end
		
	assign SDAT = (SCEN || SCLK) ? 1'bz : Q[15];

endmodule
