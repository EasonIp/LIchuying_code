/************************************************
*                 霍夫曼分组机                  *
*************************************************/

`timescale   1ns/1ns
module group
      (
      input  wire        clk,
		input  wire        rst,
		input  wire        start,
		input  wire [7:0]  group_in,
		input  wire [5:0]  sp,
		output wire [5:0]  gnumber,
		output wire [14:0] group_data 
		);
   

	reg [7:0] mem[7:0];
	reg [5:0] c[7:0];
   reg [5:0] cnt;
  
   always @(posedge clk, negedge rst)
        if (!rst)
		      begin
            cnt <= 1;
            {mem[0],mem[1],mem[2],mem[3],mem[4],mem[5],mem[6],mem[7]} <= 0;
            {c[0],c[1],c[2],c[3],c[4],c[5],c[6],c[7]} <= 0;
		      end
        else
		      if(start)
                 begin		  
                 if (group_in == mem[0])
                     c[0] <= c[0] + 1;                        
                 else if(group_in == mem[1])
				     	 c[1] <= c[1] + 1;
			        else if(group_in == mem[2])
				     	 c[2] <= c[2] + 1;
			        else if(group_in == mem[3])
				     	 c[3] <= c[3] + 1;
			        else if(group_in == mem[4])
				     	 c[4] <= c[4] + 1;
				     else if(group_in == mem[5])
				     	 c[5] <= c[5] + 1;
				     else if(group_in == mem[6])
				     	 c[6] <= c[6] + 1;
				     else if(group_in == mem[7])
				     	 c[7] <= c[7] + 1;
				     else
				     	 begin
				     	 mem[cnt] <= group_in;
				     	 c[cnt] <= c[cnt] + 1;
				     	 cnt <= cnt + 1;
				     	 end
			        end
			   else
				     cnt <= cnt;

					  
	assign group_data = (c[0]!=0)? {1'b0,mem[sp],c[sp]} : {1'b0,mem[sp+1],c[sp+1]};
	assign gnumber = (c[0]!=0)? cnt : cnt-1;						  

	
endmodule
