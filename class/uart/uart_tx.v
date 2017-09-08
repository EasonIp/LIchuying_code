module uart_tx (clk, rst_n, tx_sel_data, tx_num, tx_d, rs232_tx);

	input clk, rst_n;
	input tx_sel_data;
	input [3:0] tx_num;
	input [7:0] tx_d;
	
	output reg rs232_tx;

	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					rs232_tx <= 1'b1;
				end
			else
				begin
					if (tx_sel_data)
						begin
							case (tx_num)
							0	:	rs232_tx <= 1'b0;
							1	:	rs232_tx <= tx_d[0];
							2	:	rs232_tx <= tx_d[1];
							3	:	rs232_tx <= tx_d[2];
							4	:	rs232_tx <= tx_d[3];
							5	:	rs232_tx <= tx_d[4];
							6	:	rs232_tx <= tx_d[5];
							7	:	rs232_tx <= tx_d[6];
							8	:	rs232_tx <= tx_d[7];
							9	:	rs232_tx <= 1'b1;
							default	:	rs232_tx <= 1'b1;
							endcase
						end
				end
		end
	


endmodule
