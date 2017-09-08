`define TS 1300	// t(su)=2us, t(wH)=17us
`define T0 0
`define T1 100		// t(su)
`define T2 `T1+50
`define T3 `T2+50
`define T4 `T3+50
`define T5 `T4+50
`define T6 `T5+50
`define T7 `T6+50
`define T8 `T7+50

module adc (clk, rst_n, sid, adc_clk, cs_n, data);

	input clk, rst_n;
	input sid;
	
	output reg adc_clk;
	output reg cs_n;
	output reg [7:0] data;

	reg [31:0] count;
	reg [7:0] temp;
	
	always @ (posedge clk or negedge rst_n)
		begin	:	lsm_1
			if (!rst_n)
				count <= 0;
			else
				begin
					if (count < `TS)
						count <= count + 1;
					else
						count <= 0;
				end
		end
		
	always @ (posedge clk or negedge rst_n)
		begin	:	lsm_2
			if (!rst_n)
				begin
					adc_clk <= 0;
					cs_n <= 1;
					temp <= 0;
					data <= 0;
				end
			else
				begin
					case (count)
					`T0	:	begin
									adc_clk <= 0;
									cs_n <= 0;
								end
					
					`T1	:	begin
									adc_clk <= 1;
									temp[7] <= sid;
								end
					`T1+25:	adc_clk <= 0;
					
					`T2	:	begin
									adc_clk <= 1;
									temp[6] <= sid;
								end
					`T2+25:	adc_clk <= 0;
					
					`T3	:	begin
									adc_clk <= 1;
									temp[5] <= sid;
								end
					`T3+25:	adc_clk <= 0;
					
					`T4	:	begin
									adc_clk <= 1;
									temp[4] <= sid;
								end
					`T4+25:	adc_clk <= 0;
					
					`T5	:	begin
									adc_clk <= 1;
									temp[3] <= sid;
								end
					`T5+25:	adc_clk <= 0;
					
					`T6	:	begin
									adc_clk <= 1;
									temp[2] <= sid;
								end
					`T6+25:	adc_clk <= 0;
					
					`T7	:	begin
									adc_clk <= 1;
									temp[1] <= sid;
								end
					`T7+25:	adc_clk <= 0;
					
					`T8	:	begin
									adc_clk <= 1;
									temp[0] <= sid;
								end
					`T8+25:	begin
									adc_clk <= 0;
									cs_n <= 1;
									data <= temp;
								end
					
					`TS	:	cs_n <= 0;
					
					default 	:	;
					
					endcase
				end
		end

endmodule
