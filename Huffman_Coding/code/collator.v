/************************************************
*                 霍夫曼排序机                  *
*************************************************/
`timescale   1ns/1ns

module collator
      (
      input  wire         clk        ,
		input  wire         rst        ,
		input  wire         up         ,
		input  wire         down       ,
		input  wire         rd         ,
		input  wire [14:0]  group_data ,
		output wire [8:0]   result_data,
		output wire [8:0]   Ldata      ,
		output wire [8:0]   Rdata      ,
		output wire [8:0]   Ddata      ,
		output reg  [5:0]   sp
		);
   
	reg  [14:0]   mem[7:0];
	reg  [14:0]   fock[6:0];
	reg  [7:0]    flag;
	wire [14:0]   collator_in;
	
//////////////////////////////////////////调试完删除
	wire [8:0] Fsee0;
	assign Fsee0 = mem[0][14:6];
	wire [5:0] FCsee0;
	assign FCsee0 = mem[0][5:0];
	
   wire [8:0] Fsee1;
	assign Fsee1 = mem[1][14:6];
	wire [5:0] FCsee1;
	assign FCsee1 = mem[1][5:0];

   wire [8:0] Fsee2;
	assign Fsee2 = mem[2][14:6];
	wire [5:0] FCsee2;
	assign FCsee2 = mem[2][5:0];

   wire [8:0] Fsee3;
	assign Fsee3 = mem[3][14:6];
	wire [5:0] FCsee3;
	assign FCsee3 = mem[3][5:0];

   wire [8:0] Fsee4;
	assign Fsee4 = mem[4][14:6];
	wire [5:0] FCsee4;
	assign FCsee4 = mem[4][5:0];

   wire [8:0] Fsee5;
	assign Fsee5 = mem[5][14:6];
	wire [5:0] FCsee5;
	assign FCsee5 = mem[5][5:0];	
/////////////////////////////////////////////////

   assign collator_in = up?  fock[sp] : group_data; //输入切换                      								
	assign result_data = rd?  mem[sp][14:6] : 123;   //排序结构输出  
 	assign Ldata = mem[sp][14:6];                    //二叉树左支输出
   assign Rdata = mem[sp+1][14:6];                  //二叉树右支输出
   assign Ddata = fock[sp][14:6];	                //二叉树节点输出

	
	always @(posedge clk or negedge rst)             //计数指针
	   if (!rst)
		    sp <= 0;
		else
	       if(up||down||rd)
			     sp <= sp + 1;
			 else
			     sp <= 0;
	
	
	always @*
      	begin
      		if (collator_in[5:0] <= mem[0][5:0])
      			flag[0] <= 1;
      		else
      			flag[0] <= 0;
      			
      		if (collator_in[5:0] <= mem[1][5:0])
      			flag[1] <= 1;
      		else
      			flag[1] <= 0;
      			
      		if (collator_in[5:0] <= mem[2][5:0])
      			flag[2] <= 1;
      		else
      			flag[2] <= 0;
      			
      		if (collator_in[5:0] <= mem[3][5:0])
      			flag[3] <= 1;
      		else
      			flag[3] <= 0;
      			
      		if (collator_in[5:0] <= mem[4][5:0])
      			flag[4] <= 1;
      		else
      			flag[4] <= 0;
      			
      		if (collator_in[5:0] <= mem[5][5:0])
      			flag[5] <= 1;
      		else
      			flag[5] <= 0;
      			
      		if (collator_in[5:0] <= mem[6][5:0])
      			flag[6] <= 1;
      		else
      			flag[6] <= 0;
      			
      		if (collator_in[5:0] <= mem[7][5:0])
      			flag[7] <= 1;
      		else
      			flag[7] <= 0;	
      	end
			 		
			
	always @ (negedge clk or negedge rst)
		if (!rst)
			begin
				fock[0] <= 15'b1_00000000_000000;
				fock[1] <= 15'b1_00000001_000000;
				fock[2] <= 15'b1_00000010_000000;
				fock[3] <= 15'b1_00000011_000000;
				fock[4] <= 15'b1_00000100_000000;
				fock[5] <= 15'b1_00000101_000000;
				fock[6] <= 15'b1_00000110_000000;
			end
		else if(up)
			 fock[sp][5:0] <= mem[sp][5:0] + mem[sp+1][5:0]; 
		    
			   
			
	always @ (posedge clk or negedge rst)
		if (!rst)
			begin
				mem[0]  <= 15'b0_00000000_111111;
				mem[1]  <= 15'b0_00000000_111111;
				mem[2]  <= 15'b0_00000000_111111;
				mem[3]  <= 15'b0_00000000_111111;
				mem[4]  <= 15'b0_00000000_111111;
				mem[5]  <= 15'b0_00000000_111111;
				mem[6]  <= 15'b0_00000000_111111;
				mem[7]  <= 15'b0_00000000_111111;
			end
		else
		   begin
			case(flag)
				8'b1111_1111 : begin		
			                  if(down)	
				                  begin
										mem[0] <= collator_in;
										mem[1] <= mem[0];
										mem[2] <= mem[1];
										mem[3] <= mem[2];
										mem[4] <= mem[3];
										mem[5] <= mem[4];
										mem[6] <= mem[5];
										mem[7] <= mem[6];
									   end
									end
				8'b1111_1110 : begin
				               if(up)
										mem[0] <= collator_in;			
			                  else if(down)	
				                  begin
										mem[1] <= collator_in;
										mem[2] <= mem[1];
										mem[3] <= mem[2];
										mem[4] <= mem[3];
										mem[5] <= mem[4];
										mem[6] <= mem[5];
										mem[7] <= mem[6];
									   end
									end
				8'b1111_1100 : begin
				               if(up)
									   begin
										mem[0] <= mem[1];									
										mem[1] <= collator_in;
                              end										
			                  else if(down)	
				                  begin
										mem[2] <= collator_in;
										mem[3] <= mem[2];
										mem[4] <= mem[3];
										mem[5] <= mem[4];
										mem[6] <= mem[5];
										mem[7] <= mem[6];
									   end
									end												
				8'b1111_1000 : begin
				               if(up)
									   begin
										mem[0] <= mem[1];
										mem[1] <= mem[2];									
										mem[2] <= collator_in;
                              end										
			                  else if(down)	
				                  begin
										mem[3] <= collator_in;
										mem[4] <= mem[3];
										mem[5] <= mem[4];
										mem[6] <= mem[5];
										mem[7] <= mem[6];
									   end
									end
				8'b1111_0000 : begin
				               if(up)
									   begin
										mem[0] <= mem[1];
										mem[1] <= mem[2];
										mem[2] <= mem[3];									
										mem[3] <= collator_in;
                              end										
			                  else if(down)	
				                  begin
										mem[4] <= collator_in;
										mem[5] <= mem[4];
										mem[6] <= mem[5];
										mem[7] <= mem[6];
									   end
									end
				8'b1110_0000 : begin
				               if(up)
									   begin
										mem[0] <= mem[1];
										mem[1] <= mem[2];
										mem[2] <= mem[3];
										mem[3] <= mem[4];									
										mem[4] <= collator_in;
                              end										
			                  else if(down)	
				                  begin
										mem[5] <= collator_in;
										mem[6] <= mem[5];
										mem[7] <= mem[6];
									   end
									end															
				8'b1100_0000 : begin
				               if(up)
									   begin
										mem[0] <= mem[1];
										mem[1] <= mem[2];
										mem[2] <= mem[3];
										mem[3] <= mem[4];
										mem[4] <= mem[5];
										mem[5] <= collator_in;
                              end										
			                  else if(down)	
				                  begin
										mem[6] <= collator_in;
										mem[7] <= mem[6];
									   end
									end			
				8'b1000_0000 : begin
				               if(up)
									   begin
										mem[0] <= mem[1];
										mem[1] <= mem[2];
										mem[2] <= mem[3];
										mem[3] <= mem[4];
										mem[4] <= mem[5];
										mem[5] <= mem[6];									   
										mem[6] <= collator_in;
                              end										
			                  else if(down)	
										mem[7] <= collator_in;
									end
				8'b0000_0000 : begin
				               if(up)
									   begin
										mem[0] <= mem[1];
										mem[1] <= mem[2];
										mem[2] <= mem[3];
										mem[3] <= mem[4];
										mem[4] <= mem[5];
										mem[5] <= mem[6];
										mem[6] <= mem[7];									   
										mem[7] <= collator_in;
                              end										
									end
			endcase			
	      end


endmodule
