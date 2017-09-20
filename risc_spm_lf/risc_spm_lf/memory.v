module memory(clk, rst_n, mem_data, mem_write, mem_q, mem_addr);

	input clk, rst_n;
	input [7:0] mem_data;
	input mem_write;
	input [7:0] mem_addr;
	output reg [7:0] mem_q;

	reg [7:0] mem [255:0];
	initial begin
		$readmemb("mem_init.txt", mem);
	end

	always @ (posedge clk)
	begin
		if (!rst_n)
			mem_q <= 8'h0;
		else if (mem_write)
			mem[mem_addr] <= mem_data;
		else
			mem_q <= mem[mem_addr];
	end

endmodule
