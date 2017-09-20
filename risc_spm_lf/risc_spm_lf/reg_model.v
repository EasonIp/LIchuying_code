module reg_model(clk, rst_n, data_in, load, data_out);

	input clk, rst_n;
	input [7:0] data_in;
	input load;
	output reg [7:0] data_out;
	
	always @ (posedge clk)
	begin
		if (!rst_n)
			data_out <= 8'd0;
		else if (load)
			data_out <= data_in;
	end

endmodule
