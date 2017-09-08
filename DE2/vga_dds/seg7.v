module seg7 (rst_n, data, hex);

	input rst_n;
	input [3:0] data;
	
	output reg [6:0] hex;
	
	always @ (*)
		begin
			if (!rst_n)
				hex = 7'b111_1111;			// null
			else
				begin
					case (data)
					0	:	hex = 7'b100_0000;		// digit 0
					1	:	hex = 7'b111_1001;		// digit 1
					2	:	hex = 7'b010_0100;		// digit 2
					3	:	hex = 7'b011_0000;		// digit 3
					4	:	hex = 7'b001_1001;		// digit 4
					5	:	hex = 7'b001_0010;		// digit 5
					6	:	hex = 7'b000_0010;		// digit 6
					7	:	hex = 7'b111_1000;		// digit 7
					8	:	hex = 7'b000_0000;		// digit 8
					9	:	hex = 7'b001_0000;		// digit 9
					10	:	hex = 7'b000_1000;		// digit A
					11	:	hex = 7'b000_0011;		// digit B - b
					12	:	hex = 7'b100_0110;		// digit C
					13	:	hex = 7'b010_0001;		// digit D - d
					14	:	hex = 7'b000_0110;		// digit E
					15	:	hex = 7'b000_1110;		// digit F
					default	:	hex = 7'b111_1111;			// null
					endcase
				end
		end

endmodule
