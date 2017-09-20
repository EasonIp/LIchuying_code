module risc_spm_lf(clk, rst_n, p0, p1, halt);

	input clk, rst_n;
	output [7:0] p0;
	output [3:0] p1;
	output halt;
	
	wire load_ir, load_pc, inc_pc;
	wire load_r0, load_r1, load_r2, load_r3;
	wire [2:0] sel_mux1;
	wire [7:0] instr;
	wire write, load_y, load_z;
	wire z_flag;
	wire [1:0] sel_mux2;
	wire load_addr;
	
	controller controller_inst(
		.clk(clk), 
		.rst_n(rst_n), 
		.load_ir(load_ir), 
		.load_pc(load_pc), 
		.inc_pc(inc_pc), 
		.load_r0(load_r0), 
		.load_r1(load_r1),
		.load_r2(load_r2), 
		.load_r3(load_r3), 
		.sel_mux1(sel_mux1), 
		.instr(instr), 
		.write(write), 
		.load_y(load_y), 
		.load_z(load_z), 
		.z_flag(z_flag), 
		.sel_mux2(sel_mux2), 
		.load_addr(load_addr),
		.halt(halt)
	);

	datapath datpath_inst(
		.clk(clk), 
		.rst_n(rst_n), 
		.load_ir(load_ir), 
		.load_pc(load_pc), 
		.inc_pc(inc_pc), 
		.load_r0(load_r0), 
		.load_r1(load_r1),
		.load_r2(load_r2), 
		.load_r3(load_r3), 
		.sel_mux1(sel_mux1), 
		.instr(instr), 
		.write(write), 
		.load_y(load_y), 
		.load_z(load_z), 
		.z_flag(z_flag), 
		.sel_mux2(sel_mux2), 
		.load_addr(load_addr)
	);

endmodule
