module fifo (clk, rst_n, q);

	input clk, rst_n;
	
	output [7:0] q;
	
	wire wrfull, wrempty, rdfull, rdempty;
	wire wrreq, rdreq;
	wire [7:0] data;

	fifo_write fifo_write_inst(
			.clk(clk), 
			.rst_n(rst_n), 
			.wrfull(wrfull), 
			.wrempty(wrempty), 
			.wrreq(wrreq), 
			.data(data)
		);

	fifo_read fifo_read_inst(
			.clk(clk), 
			.rst_n(rst_n), 
			.rdfull(rdfull), 
			.rdempty(rdempty), 
			.rdreq(rdreq) 
		);

	my_fifo	my_fifo_inst (
			.data ( data ),
			.rdclk ( clk ),
			.rdreq ( rdreq ),
			.wrclk ( clk ),
			.wrreq ( wrreq ),
			.q ( q ),
			.rdempty ( rdempty ),
			.rdfull ( rdfull ),
			.wrempty ( wrempty ),
			.wrfull ( wrfull )
		);

endmodule
