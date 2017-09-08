module dds_controller (clk, rst_n, key_out, addr, sine_q, square_q, o_wave);

	input clk, rst_n;
	input [1:0] key_out;
	input [7:0] sine_q, square_q;
	
	output [7:0] addr;
	output reg [7:0] o_wave;
	
	parameter phase = 64;
	parameter Freq1k = 107374; 	// for 40 Mhz VGA_CLK
	
	reg [7:0] wave_cnt;
	reg [7:0] freq_cnt;
	reg [31:0] addr_cnt;
	reg [31:0] freq;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					addr_cnt[31:24] <= phase;
					addr_cnt[23:0] <= 24'd0;
				end
			else
				begin
					addr_cnt = addr_cnt + freq;
				end
		end

	assign addr = addr_cnt[31:24];

	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					wave_cnt <= 0;
				end
			else
				begin
					if (!key_out[0])
						begin
							wave_cnt <= wave_cnt;
						end
					else
						begin
							if (wave_cnt < 1)
								begin
									wave_cnt <= wave_cnt + 1;
								end
							else
								begin
									wave_cnt <= 0;
								end
						end
				end
		end
		
	always @ (*)
		begin
			case (wave_cnt)
			0	:	o_wave = sine_q;
			1	:	o_wave = square_q;
			endcase
		end

	always @ (posedge clk or negedge rst_n)
		begin
			if (!rst_n)
				begin
					freq_cnt <= 0;
				end
			else
				begin
					if (!key_out[1])
						begin
							freq_cnt <= freq_cnt;
						end
					else
						begin
							if (freq_cnt < 3)
								begin
									freq_cnt <= freq_cnt + 1;
								end
							else
								begin
									freq_cnt <= 0;
								end
						end
				end
		end
		
	always @ (*)
		begin
			case (freq_cnt)
			0	:	freq = Freq1k * 50;		// 50 kHz
			1	:	freq = Freq1k * 100;	// 100 kHz
			2	:	freq = Freq1k * 200;	// 200 kHz
			3	:	freq = Freq1k * 500;	// 500 kHz
			endcase
		end

endmodule 
