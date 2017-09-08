module fifo_write (clk, rst_n, wrfull, wrempty, wrreq, data);

	input clk, rst_n;
	input wrfull, wrempty;
	
	output reg wrreq;
	output reg [7:0] data;
	
	reg state;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					wrreq <= 0;
					data <= 0;
					state <= 0;
				end
			else
				begin
					case (state)
					0	:	begin
								if (wrempty)
									begin
										wrreq <= 1;
										data <= 0;
										state <= 1;
									end
								else
									state <= 0;
							end
							
					1	:	begin
								if (wrfull)
									begin
										wrreq <= 0;
										data <= 0;
										state <= 0;
									end
								else
									begin
										wrreq <= 1;
										data <= data + 8'd1;
										state <= 1;
									end
							end
					
					default	:	state <= 0;
			
					endcase
				end
		end

endmodule
