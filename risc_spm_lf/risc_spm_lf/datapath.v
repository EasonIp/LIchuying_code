module datapath(clk, rst_n, load_ir, load_pc, inc_pc, load_r0, load_r1,
	load_r2, load_r3, sel_mux1, instr, write, load_y, load_z, z_flag, sel_mux2, load_addr);

	input clk, rst_n;
	input load_ir, load_pc, inc_pc;
	input load_r0, load_r1, load_r2, load_r3;
	input [2:0] sel_mux1;
	output [7:0] instr;
	input write, load_y, load_z;
	output z_flag;
	input [1:0] sel_mux2;
	input load_addr;
	
	wire [7:0] r0, r1, r2, r3, pc, bus1, bus2, m_out, addr, alu_out, source, dest;
	wire alu_z_fla;
	
	assign dest = bus1;
	
	reg_model r0_inst(
		.clk(clk), 
		.rst_n(rst_n), 
		.data_in(bus2), 
		.load(load_r0), 
		.data_out(r0)
	);
	
	reg_model r1_inst(
		.clk(clk), 
		.rst_n(rst_n), 
		.data_in(bus2), 
		.load(load_r1), 
		.data_out(r1)
	);
	
	reg_model r2_inst(
		.clk(clk), 
		.rst_n(rst_n), 
		.data_in(bus2), 
		.load(load_r2), 
		.data_out(r2)
	);
	
	reg_model r3_inst(
		.clk(clk), 
		.rst_n(rst_n), 
		.data_in(bus2), 
		.load(load_r3), 
		.data_out(r3)
	);
	
	pc_model pc_inst(
		.clk(clk), 
		.rst_n(rst_n), 
		.load_pc(load_pc), 
		.inc_pc(inc_pc), 
		.pc_in(bus2), 
		.pc_out(pc)
	);

	reg_model ir_inst(
		.clk(clk), 
		.rst_n(rst_n), 
		.data_in(bus2), 
		.load(load_ir), 
		.data_out(instr)
	);
	
	mux1_model mux1_inst(
		.r0(r0), 
		.r1(r1), 
		.r2(r2), 
		.r3(r3), 
		.pc(pc), 
		.sel_mux1(sel_mux1), 
		.bus1(bus1)
	);
	
	memory mem_inst(
		.clk(clk), 
		.rst_n(rst_n), 
		.mem_data(bus1), 
		.mem_write(write), 
		.mem_q(m_out), 
		.mem_addr(addr)
	);
	
	reg_model y_inst(
		.clk(clk), 
		.rst_n(rst_n), 
		.data_in(bus2), 
		.load(load_y), 
		.data_out(source)
	);
	
	alu alu_inst(
		.x(dest), 
		.y(source), 
		.instr(instr), 
		.alu_z_fla(alu_z_fla), 
		.alu_out(alu_out)
	);

	z_model z_inst(
		.clk(clk), 
		.rst_n(rst_n), 
		.z_in(alu_z_fla), 
		.z_out(z_flag), 
		.load_z(load_z)
	);
	
	mux2_model mux2_inst(
		.alu_out(alu_out), 
		.bus1(bus1), 
		.m_out(m_out), 
		.sel_mux2(sel_mux2), 
		.bus2(bus2)
	);
	
	reg_model addr_inst(
		.clk(clk), 
		.rst_n(rst_n), 
		.data_in(bus2), 
		.load(load_addr), 
		.data_out(addr)
	);

endmodule
