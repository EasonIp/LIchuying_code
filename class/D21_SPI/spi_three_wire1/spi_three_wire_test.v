`timescale 1ns/1ns

module spi_three_wire_test;
  
	reg reset;
	reg CLK;
	reg GO;
	reg [3:0] bitcount;
	
	wire SCLK;
	wire bitcountEN;
	wire rstbitcount;
	wire LDEN;
	wire SHEN;
	wire SCEN;
	wire ORDY;
	wire SPC;
    
	spi_three_wire dut (
		reset,CLK,GO,bitcount,SCLK,bitcountEN,rstbitcount,LDEN,SHEN,SCEN,ORDY,SPC);
  
	initial
		begin
			CLK = 0;
			reset = 1;
			GO = 0;
			bitcount = 0;
			
			#100
			reset = 0;
			GO = 1;
			#100
			GO = 0;
			
			#150
			bitcount = 1;
			#100
			bitcount = 2;
			#100
			bitcount = 3;
			#100
			bitcount = 4;
			#100
			bitcount = 5;
			#100
			bitcount = 6;
			#100
			bitcount = 7;
			#100
			bitcount = 8;
			#100
			bitcount = 9;
			#100
			bitcount = 10;
			#100
			bitcount = 11;
			#100
			bitcount = 12;
			#100
			bitcount = 13;
			#100
			bitcount = 14;
			#100
			bitcount = 15;
			
			#1000 $stop;
		end
   
	always #50 CLK = ~CLK;
  
endmodule
