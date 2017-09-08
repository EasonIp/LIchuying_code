`timescale 1ns/1ps

module adc_tb;

	reg clk;
	reg rst_n;
	reg sid;
	wire adc_clk;
   wire cs_n;
   wire [7:0] data;
	
	adc dut(
			.clk(clk),
			.rst_n(rst_n),
			.sid(sid), 				//输入串行数据
			.adc_clk(adc_clk),
			.cs_n(cs_n), 			//片选信号 低有效
			.data(data)
		);

	reg  [7:0]	data_in;
	
	initial
		begin
			clk = 1;
			rst_n = 0;
			sid = 0;
			#200.1
			rst_n = 1;
			
			data_in = 8'h66;
			#1500 sid = data_in[7];
			#1000 sid = data_in[6];
			#1000 sid = data_in[5];
			#1000 sid = data_in[4];
			#1000 sid = data_in[3];
			#1000 sid = data_in[2];
			#1000 sid = data_in[1];
			#1000 sid = data_in[0];
			
			#17000
			data_in = 8'haa;
			#2000 sid = data_in[7];
			#1000 sid = data_in[6];
			#1000 sid = data_in[5];
			#1000 sid = data_in[4];
			#1000 sid = data_in[3];
			#1000 sid = data_in[2];
			#1000 sid = data_in[1];
			#1000 sid = data_in[0];
			
			#17000 $stop;
		end	

	always #10 clk=~clk;

endmodule 
