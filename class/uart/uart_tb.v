`timescale 1ns/1ps

module uart_tb;

	reg clk, rst_n;
	reg rs232_rx;
	
	wire rs232_tx;
	
	uart dut (.clk(clk), .rst_n(rst_n), .rs232_rx(rs232_rx), .rs232_tx(rs232_tx));

	initial
		begin
			clk = 1;
			rst_n = 0;
			rs232_rx = 1;
			#200.1
			rst_n = 1;
			#200	rs232_rx = 0;
			
			#104166	rs232_rx = 1;		//data = 8'ha5 (8'b10100101)
			#104166	rs232_rx = 0;
			#104166	rs232_rx = 1;
			#104166	rs232_rx = 0;
			#104166	rs232_rx = 0;
			#104166	rs232_rx = 1;
			#104166	rs232_rx = 0;
			#104166	rs232_rx = 1;
			
			#104166	rs232_rx = 1;
			
			#1500000	$stop;
		end
		
	always #10 clk = ~clk;

endmodule
