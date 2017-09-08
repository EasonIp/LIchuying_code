module ram_controller (clk, rst_n, wren, addr, data);

	input clk, rst_n;
	
	output reg wren;
	output reg [7:0] addr;
	output reg [7:0] data;

	reg [1:0] state;
	reg [7:0] start_num;

	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					start_num <= 0;
					wren <= 0;
					addr <= 0;
					data <= 0;
					state <= 0;
				end
			else
				begin
					case (state)
					0	:	begin						// intialize for wren=1
								start_num <= 0;
								wren <= 1;
								addr <= 0;
								data <= 0;
								state <= 1;
							end

					1	:	begin						// write 256 digits
								if (addr < 255)
									begin
										wren <= 1;
										addr <= addr + 8'd1;
										data <= data + 8'd1;
									end
								else
									begin
										wren <= 0;
										addr <= 0;
										data <= data + 8'd1;
										state <= 2;
									end
							end
							
					2	:	begin						// read 256 digits
								if (addr < 255)
									begin
										wren <= 0;
										addr <= addr + 8'd1;
									end
								else
									begin
										start_num <= start_num + 8'd128;
										wren <= 1;
										addr <= 0;
										data <= start_num + 8'd128;
										state <= 1;
									end
							end
					
					default	:	state <= 0;
					
					endcase
				end
		end

endmodule
