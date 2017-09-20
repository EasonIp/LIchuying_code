`include "spm_head.v"

module controller(clk, rst_n, load_ir, load_pc, inc_pc, load_r0, load_r1,
	load_r2, load_r3, sel_mux1, instr, write, load_y, load_z, z_flag, sel_mux2, load_addr,
	halt);

	input clk, rst_n;
	output reg load_ir, load_pc, inc_pc;
	output reg load_r0, load_r1, load_r2, load_r3;
	output reg [2:0] sel_mux1;
	input [7:0] instr;
	output reg write, load_y, load_z;
	input z_flag;
	output reg [1:0] sel_mux2;
	output reg load_addr;
	output reg halt;
	
	wire [3:0] opcode;
	wire [1:0] src, dest;
	reg [3:0] state;
	
	localparam s0 = 4'b0000;
	localparam s1 = 4'b0001;
	localparam s2 = 4'b0010;
	localparam s3 = 4'b0011;
	localparam s4 = 4'b0100;
	localparam s5 = 4'b0101;
	localparam s6 = 4'b0110;
	localparam s7 = 4'b0111;
	localparam s8 = 4'b1000;
	localparam s9 = 4'b1001;
	
	assign opcode = instr[7:4];
	assign src = instr[3:2];
	assign dest = instr[1:0];
	
	always @ (posedge clk)
	begin : plsm_1s_cn
		if (!rst_n)
			begin
				load_addr <= 1'b0;
				inc_pc <= 1'b0;
				load_ir <= 1'b0;
				write <= 1'b0;
				sel_mux1 <= `SEL_MUX1_PC;
				sel_mux2 <= `SEL_MUX2_BUS1;
				halt <= 1'b0;
				load_r0 <= 1'b0;
				load_r1 <= 1'b0;
				load_r2 <= 1'b0;
				load_r3 <= 1'b0;
				load_pc <= 1'b0;
				load_y <= 1'b0;
				load_z <= 1'b0;
				state <= s0;	
			end
		else
			case (state)
				s0	:	begin
							load_addr <= 1'b1;
							inc_pc <= 1'b1;
							sel_mux1 <= `SEL_MUX1_PC;
							sel_mux2 <= `SEL_MUX2_BUS1;
							state <= s1;
						end
						
				s1	:	begin
							load_addr <= 1'b0;
							inc_pc <= 1'b0;
							write <= 1'b0;
							state <= s2;
						end
						
				s2	:	begin
							load_ir <= 1'b1;
							sel_mux2 <= `SEL_MUX2_MEM;
							state <= s3;
						end
						
				s3	:	begin
							load_ir <= 1'b0;
							state <= s4;
						end
						
				default 	: 	case (opcode)		
									`NOP	:	state <= s0;
									`ADD	:	task_arith;
									`SUB	:	task_arith;
									`AND	:	task_arith;
									`NOT	:	task_arith;
									`RD	:	task_rd;
									`WR	:	task_wr;
									`BR	:	task_br;
									`BRZ	:	if (z_flag)
													task_br;
												else
													task_brz_nz;
									`HLT	:	begin
													halt <= 1'b1;
													state <= s4;
												end
								endcase	
			endcase
	end

	task task_arith;
		case (state)
			s4	:	begin
						load_y <= 1'b1;
						sel_mux1 <= {1'b0, src};
						sel_mux2 <= `SEL_MUX2_BUS1;
						state <= s5;
					end
					
			s5	:	begin
						case (dest)
							0	:	load_r0 <= 1'b1;
							1	:	load_r1 <= 1'b1;
							2	:	load_r2 <= 1'b1;
							3	:	load_r3 <= 1'b1;
						endcase
						load_z <= 1'b1;
						load_y <= 1'b0;
						sel_mux1 <= {1'b0, dest};
						sel_mux2 <= `SEL_MUX2_ALU;
						state <= s6;
					end
					
			s6	:	begin
						case (dest)
							0	:	load_r0 <= 1'b0;
							1	:	load_r1 <= 1'b0;
							2	:	load_r2 <= 1'b0;
							3	:	load_r3 <= 1'b0;
						endcase
						load_z <= 1'b0;
						state <= s0;
					end
		endcase
	endtask

	task task_rd;
		case (state)
			s4	:	begin
						load_addr <= 1'b1;
						inc_pc <= 1'b1;
						sel_mux1 <= `SEL_MUX1_PC;
						sel_mux2 <= `SEL_MUX2_BUS1;
						state <= s5;
					end
					
			s5	:	begin
						load_addr <= 1'b0;
						write <= 1'b0;
						inc_pc <= 1'b0;
						state <= s6;
					end
					
			s6	:	begin
						load_addr <= 1'b1;
						sel_mux2 <= `SEL_MUX2_MEM;
						state <= s7;
					end
					
			s7	:	begin
						load_addr <= 1'b0;
						write <= 1'b0;
						state <= s8;
					end
					
			s8	:	begin
						case (dest)
							0	:	load_r0 <= 1'b1;
							1	:	load_r1 <= 1'b1;
							2	:	load_r2 <= 1'b1;
							3	:	load_r3 <= 1'b1;
						endcase
						sel_mux2 <= `SEL_MUX2_MEM;
						state <= s9;
					end
					
			s9	:	begin
						case (dest)
							0	:	load_r0 <= 1'b0;
							1	:	load_r1 <= 1'b0;
							2	:	load_r2 <= 1'b0;
							3	:	load_r3 <= 1'b0;
						endcase
						state <= s0;
					end
		endcase
	endtask

	task task_wr;
		case (state)
			s4	:	begin
						load_addr <= 1'b1;
						inc_pc <= 1'b1;
						sel_mux1 <= `SEL_MUX1_PC;
						sel_mux2 <= `SEL_MUX2_BUS1;
						state <= s5;
					end
					
			s5	:	begin
						write <= 1'b0;
						load_addr <= 1'b0;
						inc_pc <= 1'b0;
						state <= s6;
					end
					
			s6	:	begin
						load_addr <= 1'b1;
						sel_mux2 <= `SEL_MUX2_MEM;
						state <= s7;
					end
					
			s7	:	begin
						write <= 1'b1;
						load_addr <= 1'b0;
						sel_mux1 <= {1'b0, src};
						state <= s8;
					end
					
			s8	:	begin
						write <= 1'b0;
						state <= s0;
					end
		endcase
	endtask

	task task_br;
		case (state)
			s4	:	begin
						load_addr <= 1'b1;
						sel_mux1 <= `SEL_MUX1_PC;
						sel_mux2 <= `SEL_MUX2_BUS1;
						state <= s5;
					end
					
			s5	:	begin
						write <= 1'b0;
						load_addr <= 1'b0;
						state <= s6;
					end
					
			s6	:	begin
						load_pc <= 1'b1;
						sel_mux2 <= `SEL_MUX2_MEM;
						state <= s7;
					end
					
			s7	:	begin
						load_pc <= 1'b0;
						state <= s0;
					end
		endcase
	endtask
	
	
	task task_brz_nz;
		case (state)
			s4	:	begin
						inc_pc <= 1'b1;
						state <= s5;
					end
					
			s5	:	begin
						inc_pc <= 1'b0;
						state <= s0;
					end
		endcase
	endtask

endmodule
