module uart_rx (clk, rst_n, rs232_rx, rx_sel_data, rx_num, rx_en, tx_en, rx_d);

	input clk, rst_n;
	input rs232_rx;
	input rx_sel_data;
	input [3:0] rx_num;
	
	output rx_en;
	output reg tx_en;
	output reg [7:0] rx_d;

	
	reg d, dd;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					d <= 1'b1;
					dd <= 1'b1;
				end
			else
				begin
					d <= rs232_rx;
					dd <= d;
				end
		end
	
	assign rx_en = dd & (~d);

	
	reg [7:0] rx_data;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					rx_data <= 8'd0;
					rx_d <= 8'd0;
				end
			else
				begin
					if (rx_sel_data)
						begin
							case (rx_num)
							0	:	;
							1	:	rx_data[0] <= rs232_rx;
							2	:	rx_data[1] <= rs232_rx;
							3	:	rx_data[2] <= rs232_rx;
							4	:	rx_data[3] <= rs232_rx;
							5	:	rx_data[4] <= rs232_rx;
							6	:	rx_data[5] <= rs232_rx;
							7	:	rx_data[6] <= rs232_rx;
							8	:	rx_data[7] <= rs232_rx;
							9	:	rx_d <= rx_data;
							default	:	;
							endcase
						end
				end
		end

	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					tx_en <= 0;
				end
			else
				begin
					if (rx_sel_data && (rx_num == 4'd9))
						tx_en <= 1;
					else 
						tx_en <= 0;
				end
		end
		
endmodule
