`timescale 1ns/1ps
`include "spm_head.v"

module risc_spm_lf_tb;

	reg clk, rst_n;
	wire [7:0] p0;
	wire [3:0] p1;
	wire halt;
	
	wire [3:0] opcode;
	wire [1:0] src, dest;
	wire [7:0] r0, r1, r2, r3;
	reg [31:0] opcode_ascii;

	assign opcode = dut.instr[7:4];
	assign src = dut.instr[3:2];
	assign dest = dut.instr[1:0];
	assign r0 = dut.datpath_inst.r0;
	assign r1 = dut.datpath_inst.r1;
	assign r2 = dut.datpath_inst.r2;
	assign r3 = dut.datpath_inst.r3;
	
	risc_spm_lf dut(
		.clk(clk), 
		.rst_n(rst_n), 
		.p0(p0), 
		.p1(p1), 
		.halt(halt)
	);
	
	initial begin
		clk = 1;
		rst_n = 0;
		#200.1
		rst_n = 1;
	
		#6000 $stop;
	end

	always #10 clk = ~clk;
	
	always @ (*)
	begin
		case (opcode)
			`NOP	:	opcode_ascii = "NOP";	
			`ADD	:	opcode_ascii = "ADD";	
			`SUB	:	opcode_ascii = "SUB";	
			`AND	:	opcode_ascii = "AND";	
			`NOT	:	opcode_ascii = "NOT";	
			`RD	:	opcode_ascii = "RD";	
			`WR	:	opcode_ascii = "WR";	
			`BR	:	opcode_ascii = "BR";	
			`BRZ	:	opcode_ascii = "BRZ";	
			`HLT	:	opcode_ascii = "HLT";	
			default :	opcode_ascii = "???";	 
		endcase
	end

endmodule
