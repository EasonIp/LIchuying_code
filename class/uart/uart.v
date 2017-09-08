module uart (clk, rst_n, rs232_rx, rs232_tx);

	input clk, rst_n;
	input rs232_rx;
	
	output rs232_tx;
	
	wire rx_en, tx_en;
	wire rx_sel_data, tx_sel_data;
	wire [3:0] rx_num, tx_num;
	wire [7:0] rx_d;

	bps_rx bps_rx 
		(
			.clk(clk), 
			.rst_n(rst_n), 
			.rx_en(rx_en), 
			.rx_sel_data(rx_sel_data), 
			.rx_num(rx_num)
		);
	
	uart_rx uart_rx 
		(
			.clk(clk), 
			.rst_n(rst_n), 
			.rs232_rx(rs232_rx), 
			.rx_sel_data(rx_sel_data), 
			.rx_num(rx_num), 
			.rx_en(rx_en), 
			.tx_en(tx_en), 
			.rx_d(rx_d)
		);

	bps_tx bps_tx 
		(
			.clk(clk), 
			.rst_n(rst_n), 
			.tx_en(tx_en), 
			.tx_sel_data(tx_sel_data), 
			.tx_num(tx_num)
		);
	
	uart_tx uart_tx 
		(
			.clk(clk), 
			.rst_n(rst_n), 
			.tx_sel_data(tx_sel_data), 
			.tx_num(tx_num), 
			.tx_d(rx_d),
			.rs232_tx(rs232_tx) 
		);

		

endmodule
