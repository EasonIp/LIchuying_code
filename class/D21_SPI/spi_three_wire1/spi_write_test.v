`timescale 1ns/1ns

module spi_write_test;

	reg CLK;
	reg GO;
	reg reset;
	reg [15:0] regdata;
	
	wire SDAT;
	wire SPC;
	wire SCEN;
	wire ORDY;

	spi_write dut (CLK,SPC,SDAT,regdata,GO,ORDY,reset,SCEN);

	initial
		begin
			CLK = 0;
			reset = 1;
			GO = 0;
			regdata = 16'b1010100z_10101010;
			
			#100
			reset = 0;
			GO = 1;
			#100
			GO = 0;
			
			#2000 $stop;
		end
		
	always #50 CLK = ~CLK;

endmodule
