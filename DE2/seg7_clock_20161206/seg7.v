module seg7 (clk, rst_n, data, sel, seg);

	input clk, rst_n;
	input [23:0] data;
	
	output reg [2:0] sel;
	output reg [7:0] seg;
	
	reg clk_1k;
	
	parameter T1ms = 25_000;		// half width of 1ms / 20ns = 50_000
	reg [19:0] count;

	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					count <= 0;
					clk_1k <= 1;
				end
			else
				begin
					if (count < T1ms - 1)
						count <= count + 20'd1;
					else
						begin
							count <= 0;
							clk_1k <= ~clk_1k;
						end
				end
		end
	
//	reg [3:0] data_temp;
//	reg [2:0] state;
	
	always @ (posedge clk_1k or negedge rst_n)
		begin
			if (!rst_n)
				begin
					sel <= 3'b101;
//					data_temp <= 24'h0;
//					state <= 0;
				end
			else
				begin
					if (sel < 5)
						begin
							sel <= sel + 3'd1;
//							data_temp <= data[(16-(sel<<2)) +: 4];
//							data_temp <= {data_temp[19:0], data_temp[23:20]};
						end
					else
						begin
							sel <= 3'b000;
//							data_temp <= data[23:20];
						end
					
//					case (state)
//					0	:	begin
//								sel <= 3'b000;
//								data_temp <= data[23:20];
//								state <= 1;
//							end
//								
//					1	:	begin
//								sel <= 3'b001;
//								data_temp <= data[19:16];
//								state <= 2;
//							end
//								
//					2	:	begin
//								sel <= 3'b010;
//								data_temp <= data[15:12];
//								state <= 3;
//							end
//								
//					3	:	begin
//								sel <= 3'b011;
//								data_temp <= data[11:8];
//								state <= 4;
//							end
//								
//					4	:	begin
//								sel <= 3'b100;
//								data_temp <= data[7:4];
//								state <= 5;
//							end
//								
//					5	:	begin
//								sel <= 3'b101;
//								data_temp <= data[3:0];
//								state <= 0;
//							end
//								
//					default	:	state <= 0;
//					
//					endcase
				end
		end

	always @ (*)
		begin
			if (!rst_n)
				begin
					seg = 8'b1111_1111;			// null
				end
			else
				begin
//					case (data_temp)
					case (data[(20-(sel<<2)) +: 4])
					0	:	seg = 8'b1100_0000;		// digit 0
					1	:	seg = 8'b1111_1001;		// digit 1
					2	:	seg = 8'b1010_0100;		// digit 2
					3	:	seg = 8'b1011_0000;		// digit 3
					4	:	seg = 8'b1001_1001;		// digit 4
					5	:	seg = 8'b1001_0010;		// digit 5
					6	:	seg = 8'b1000_0010;		// digit 6
					7	:	seg = 8'b1111_1000;		// digit 7
					8	:	seg = 8'b1000_0000;		// digit 8
					9	:	seg = 8'b1001_0000;		// digit 9
					10	:	seg = 8'b1000_1000;		// digit A
					11	:	seg = 8'b1000_0011;		// digit B - b
					12	:	seg = 8'b1100_0110;		// digit C
					13	:	seg = 8'b1010_0001;		// digit D - d
					14	:	seg = 8'b1000_0110;		// digit E
					15	:	seg = 8'b1000_1110;		// digit F
					default	:	seg = 8'b1111_1111;			// null
					endcase
				end
		end

endmodule
