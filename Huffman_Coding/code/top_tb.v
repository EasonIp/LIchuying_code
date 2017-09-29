`timescale 1ns/1ns

module top_tb;

	reg   clk,rst,start;
	reg   [7:0]   indata;
	reg   [5:0]   addr;
	wire          done;
	wire  [7:0]   out_result;    
	wire  [2:0]   out_L;
	wire  [7:0]   out_W;
	
top TOP(
       .clk(clk),
		 .rst(rst),
		 .start(start),
		 .addr(addr),
		 .done(done),
		 .indata(indata),
	    .out_result(out_result),    
	    .out_L(out_L),
	    .out_W(out_W)
		 );

always  begin
        clk = 1'b1; #10;
        clk = 1'b0; #10;
        end		

initial begin
        rst = 0; 
		  start = 0;
        #200 rst = 1;
        #20  indata = 11; start = 1; 
        #20  indata = 22;
        #20  indata = 44;
        #20  indata = 44;
        #20  indata = 33;
        #20  indata = 55;
        #20  indata = 55;
        #20  indata = 55;
        #20  indata = 11;
        #20  indata = 22;
        #20  indata = 44;
        #20  indata = 44;
        #20  indata = 33;
        #20  indata = 55;
        #20  indata = 55;
        #20  indata = 55;
        #20  indata = 11;
        #20  indata = 22;
        #20  indata = 44;
        #20  indata = 44;
        #20  indata = 33;
        #20  indata = 55;
        #20  indata = 55;
        #20  indata = 55; 
        #20  indata = 11;
        #20  indata = 22;
        #20  indata = 44;
        #20  indata = 44;
        #20  indata = 33;
        #20  indata = 55;
        #20  indata = 55;
        #20  indata = 55;
        #20  indata = 0;   //6
        #20  indata = 0;   //6
        #20  indata = 0;   //6
        #20  indata = 66;  //7
        #20  indata = 66;  //7
        #20  indata = 66;  //7
        #20  indata = 77;  //8
        #20  indata = 77;  //8	  
        #20  start = 0;
        @(posedge done);
        #20 addr = 0;
        #20 addr = 1;
        #20 addr = 2;
        #20 addr = 3;
        #20 addr = 4;
        #20 addr = 5;	   //6
        #20 addr = 6;	   //7
        #20 addr = 7;	   //8		  
        #1000 $stop;
        end		  
		  
endmodule
