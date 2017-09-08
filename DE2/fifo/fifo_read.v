module fifo_read (clk, rst_n, rdfull, rdempty, rdreq);

	input clk, rst_n;
	input rdfull, rdempty;
	
	output reg rdreq;
	
	reg state;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					rdreq <= 0;
					state <= 0;
				end
			else
				begin
					case (state)
					0	:	begin
								if (rdfull)
									begin
										rdreq <= 1;
										state <= 1;
									end
								else
									state <= 0;
							end
					
					1	:	begin
								if (rdempty)
									begin
										rdreq <= 0;
										state <= 0;
									end
								else
									begin
										rdreq <= 1;
										state <= 1;
									end
							end
					
					default	:	state <= 0;
			
					endcase
				end
		end

endmodule
