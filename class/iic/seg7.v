module seg7 (clk, rst_n, data, sel, seg);

	input clk, rst_n;
	input [23:0] data;
	
	output reg [2:0] sel;
	output reg [7:0] seg;
	
	
	reg [19:0] count;
	reg clk_1ms;
	
	always @ (posedge clk or negedge rst_n)
		begin 
			if (!rst_n)
				begin
					clk_1ms <= 1;
				end
			else
				begin
					if (count < 24999)
						begin
							count <= count + 20'd1;
						end
					else
						begin
							count <= 0;
							clk_1ms <= ~clk_1ms;
						end
				end
		end

		
	reg [2:0] state;
	reg [3:0] data_temp;

	always @ (posedge clk_1ms or negedge rst_n)
		begin
			if (!rst_n)
				begin
					sel <= 0;
					data_temp <= 0;
					state <= 0;
				end
			else
				begin
					case (state)
					0	:	begin
								sel <= 0;
								data_temp <= data[23:20];
								state <= 1;
							end
					
					1	:	begin
								sel <= 1;
								data_temp <= data[19:16];
								state <= 2;
							end
					
					2	:	begin
								sel <= 2;
								data_temp <= data[15:12];
								state <= 3;
							end
					
					3	:	begin
								sel <= 3;
								data_temp <= data[11:8];
								state <= 4;
							end
					
					4	:	begin
								sel <= 4;
								data_temp <= data[7:4];
								state <= 5;
							end
					
					5	:	begin
								sel <= 5;
								data_temp <= data[3:0];
								state <= 0;
							end
					
					default	:	state <= 0;
					
					endcase
				end
		end
	
	
	always @ (*)
		begin
			if (!rst_n)
				begin
					seg = 8'b1111_1111;
				end
			else
				begin
					case (data_temp)
					0	:	seg = 8'b1100_0000;		//d0
					1	:	seg = 8'b1111_1001;		//d1
					2	:	seg = 8'b1010_0100;		//d2
					3	:	seg = 8'b1011_0000;		//d3
					4	:	seg = 8'b1001_1001;		//d4
					5	:	seg = 8'b1001_0010;		//d5
					6	:	seg = 8'b1000_0010;		//d6
					7	:	seg = 8'b1111_1000;		//d7
					8	:	seg = 8'b1000_0000;		//d8
					9	:	seg = 8'b1001_0000;		//d9
					10	:	seg = 8'b1000_1000;		//dA
					11	:	seg = 8'b1000_0011;		//db
					12	:	seg = 8'b1100_0110;		//dC
					13	:	seg = 8'b1010_0001;		//dd
					14	:	seg = 8'b1000_0110;		//dE
					15	:	seg = 8'b1000_1110;		//dF
					default	:	seg = 8'b1000_1110;		//dF
					endcase
				end
		end

endmodule
