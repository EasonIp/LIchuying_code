`timescale 1ns/1ns
module true2comp_tb0;

	reg [17:0] datain;
	wire [17:0] dataout,dataout1;
	
	comp2true0 u1(.datain(datain),.dataout(dataout));
	true2comp0 u2(.datain(dataout),.dataout(dataout1));
	
	initial
	begin
		datain=0;
		#1000 datain = 18'b00_0000_0000_0001_0000;	//16
		#1000 datain = 18'b11_1111_1111_1000_0000;	//-128
		#1000 datain = 18'b00_0000_0000_1000_0000;	//128
		#1000 datain = 18'b11_1111_1111_1111_0000;	//-16
		#1000 $stop;
	end
	
endmodule
