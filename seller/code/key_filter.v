module key_filter(clk, rst_n, key_in, key_out);

//	parameter MASK_TIME = 1_000_000; //20ms/20ns=10^6
	parameter MASK_TIME = 200_000; //4ms/20ns=10^6

	input clk;
	input rst_n;
	input key_in;
	output reg key_out;
	
	localparam s0 = 1'b0;
	localparam s1 = 1'b1;
	
	reg temp;
	reg [31:0] count;
	reg state;
	
	always @ (posedge clk, negedge rst_n)
	begin
		if (!rst_n)
			begin
				count <= 0;
				key_out <= 1;
				temp <= 1;
				state <= s0;
			end
		else
			case (state)
				s0	:	if (key_in == temp)
							state <= s0;
						else
							begin
								temp <= key_in;
								state <= s1;
							end
							
				s1	:	if (key_in == temp)
							if (count < MASK_TIME)
								begin
									count <= count + 1;
									state <= s1;
								end
							else
								begin
									key_out <= temp;
									count <= 0;
									state <= s0;
								end
						else
							begin
								count <= 0;
								temp <= key_in;
								state <= s1;
							end
			endcase
	end

endmodule
