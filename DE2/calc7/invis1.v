module invis1(clk,rst_n,datain,dataout);//改动1：修改模块名
	
	input clk,rst_n;
//改动2：修改输入输出的位宽
	input [20:0] datain;
	output reg [20:0] dataout;
//改动3：修改always块中的位宽，以及判断条件	
	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
		begin
			dataout <= 21'h0dddd0;
		end
		else
		begin
			casex(datain[19:0])
			20'h0000x:
				begin
					dataout <= {datain[20],16'hdddd,datain[3:0]};
				end
			20'h000xx:
				begin
					dataout <= {datain[20],12'hddd,datain[7:0]};
				end
			20'h00xxx:
				begin
					dataout <= {datain[20],8'hdd,datain[11:0]};
				end
			20'h0xxxx:
				begin
					dataout <= {datain[20],4'hd,datain[15:0]};
				end
			20'hxxxxx:
				begin
					dataout <= datain;
				end
			default: dataout <= 21'h0dddd0;
			endcase
		end
	end

endmodule
