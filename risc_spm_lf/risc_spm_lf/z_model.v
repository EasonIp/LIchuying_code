module z_model(clk, rst_n, z_in, z_out, load_z);

	input clk, rst_n;
	input z_in;
	input load_z;
	output reg z_out;

	always @ (posedge clk)
	begin
		if (!rst_n)
			z_out <= 1'b0;
		else if (load_z)
			z_out <= z_in;	
	end

endmodule
