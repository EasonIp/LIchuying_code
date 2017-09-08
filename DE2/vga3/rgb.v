module rgb(en, r, g, b);

	input [7:0] en;
	
	output [2:0] r, g;
	output [1:0] b;
	
	assign r = en[7:5];
	assign g = en[4:2];
	assign b = en[1:0];

//	assign b = en[7:6];
//	assign g = en[5:3];
//	assign r = en[2:0];

//	assign r = {en[7], en[4], en[1]};
//	assign g = {en[6], en[3], en[0]};
//	assign b = {en[5], en[2]};
	
endmodule
