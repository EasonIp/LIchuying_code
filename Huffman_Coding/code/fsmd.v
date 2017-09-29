/************************************************
*                 二叉树状态机                  *
*************************************************/
`timescale   1ns/1ns

module fsmd
   (
    input   wire          clk         , 
    input   wire          rst         ,
    input   wire          start       ,
	 input   wire   [5:0]  gnumber     ,
	 input   wire   [8:0]  result_data ,
	 input   wire   [8:0]  Ldata       ,
	 input   wire   [8:0]  Rdata       ,
	 input   wire   [8:0]  Ddata       ,
	 input   wire   [5:0]  addr        ,
    output  reg           done        ,	 
    output  reg           down        ,
    output  reg           rd          ,
    output  reg           up          ,
	 output  wire  [7:0]   out_result  ,    
	 output  wire  [2:0]   out_L       ,
	 output  wire  [7:0]   out_W      
   );
	

   reg         [5:0]  state;  
   parameter   [5:0]  s0 = 6'b000000,
                      s1 = 6'b000001,
                      s2 = 6'b000010,
			             s3 = 6'b000011,
			             s4 = 6'b000100,
			             s5 = 6'b000101,
			             s6 = 6'b000110;						 
	
	reg  [5:0]  count;
	reg  [8:0]  result[7:0];
	reg  [8:0]  result_save[7:0];
	reg  [2:0]  L[7:0];
	reg  [7:0]  W[7:0];
	
	
	assign out_result = result_save[addr][7:0];
	assign out_L = L[addr];
	assign out_W = W[addr];
		
	
   always @(posedge clk, negedge rst)
        if (!rst)
		     begin
			  done      <= 1;
           state     <= s0;
           down      <= 0;
			  up        <= 0;
			  rd        <= 0;
			  count     <= 0;
			  {result[0],result[1],result[2],result[3],result[4],result[5],result[6],result[7]} <= 0;
           {result_save[0],result_save[1],result_save[2],result_save[3],result_save[4],result_save[5],result_save[6],result_save[7]} <= 0;
           {L[0],L[1],L[2],L[3],L[4],L[5],L[6],L[7]} <= 0;
           {W[0],W[1],W[2],W[3],W[4],W[5],W[6],W[7]} <= 0;			  
		     end
        else
          case(state)
            s0:     if (start)            //开始分组
								begin
								state <= s1;
								done <= 0;
								end
                    else
                        state <= s0;
			
            s1:     if (!start)           //分组完成
                        state <= s2;
                    else
                        state <= s1;
                    
            s2:     if (count < gnumber)  //开始排序 
                        begin
				            down <= 1;
								count <= count + 1;								
                        state <= s2;
								end
                    else          
						      begin             //排序完成
                        state <= s3;
								down  <= 0;
								count <= 0;
								end

            s3:         begin
                        state <= s4;
								rd    <= 1;
								end

				s4:     if (count < gnumber)  //读取保存
				            begin
                        state <= s4;
								count <= count + 1;
								rd    <= 1;
								result[count] <= result_data;
								result_save[count] <= result_data;
								end
                    else
					         begin
                        state <= s5;
								rd    <= 0;
						      count <= 0;
						      end				
								
            s5:     begin           //二叉树递归
                    state <= s6;
                    up <= 1;
						  end
						  
            s6:   if(count < gnumber-1)  
				         begin
                     state <= s6;
                     count <= count + 1;							
				         if  (Ldata == result[0])
							                  begin
				              				   result[0] <= Ddata;  //Rdata对应左支为1
				              				   L[0] <= L[0] + 1;
                                       W[0][L[0]] <= 1'b1;
                                       end								 
				         if  (Ldata == result[1])
							                  begin
					            			   result[1] <= Ddata;
					            			   L[1] <= L[1] + 1;
                                       W[1][L[1]] <= 1'b1;
                                       end
                     if  (Ldata == result[2])
							                  begin
								               result[2] <= Ddata;
								               L[2] <= L[2] + 1;
                                       W[2][L[2]] <= 1'b1;
                                       end
                     if  (Ldata == result[3])
							                  begin
								               result[3] <= Ddata;
								               L[3] <= L[3] + 1;
                                       W[3][L[3]] <= 1'b1;
                                       end
                     if  (Ldata == result[4])
							                  begin
								               result[4] <= Ddata;
								               L[4] <= L[4] + 1;
                                       W[4][L[4]] <= 1'b1;
                                       end
                     if  (Ldata == result[5])
							                  begin
								               result[5] <= Ddata;
								               L[5] <= L[5] + 1;
                                       W[5][L[5]] <= 1'b1;
                                       end
                     if  (Ldata == result[6])
							                  begin
								               result[6] <= Ddata;
								               L[6] <= L[6] + 1;
                                       W[6][L[6]] <= 1'b1;
                                       end
                     if  (Ldata == result[7])
							                  begin
								               result[7] <= Ddata;
								               L[7] <= L[7] + 1;
                                       W[7][L[7]] <= 1'b1;
                                       end     
				         if  (Rdata == result[0])
							                  begin
				              				   result[0] <= Ddata;  //Rdata对应右支为0
				              				   L[0] <= L[0] + 1;
                                       W[0][L[0]] <= 1'b0;
                                       end								 
				         if  (Rdata == result[1])
							                  begin
					            			   result[1] <= Ddata;
					            			   L[1] <= L[1] + 1;
                                       W[1][L[1]] <= 1'b0;
                                       end
                     if  (Rdata == result[2])
							                  begin
								               result[2] <= Ddata;
								               L[2] <= L[2] + 1;
                                       W[2][L[2]] <= 1'b0;
                                       end
                     if  (Rdata == result[3])
							                  begin
								               result[3] <= Ddata;
								               L[3] <= L[3] + 1;
                                       W[3][L[3]] <= 1'b0;
                                       end
                     if  (Rdata == result[4])
							                  begin
								               result[4] <= Ddata;
								               L[4] <= L[4] + 1;
                                       W[4][L[4]] <= 1'b0;
                                       end
                     if  (Rdata == result[5])
							                  begin
								               result[5] <= Ddata;
								               L[5] <= L[5] + 1;
                                       W[5][L[5]] <= 1'b0;
                                       end
                     if  (Rdata == result[6])
							                  begin
								               result[6] <= Ddata;
								               L[6] <= L[6] + 1;
                                       W[6][L[6]] <= 1'b0;
                                       end
                     if  (Rdata == result[7])
							                  begin
								               result[7] <= Ddata;
								               L[7] <= L[7] + 1;
                                       W[7][L[7]] <= 1'b0;
                                       end
                     end
					  else
					      begin
                     state <= s0;
						   up    <= 0;
						   count <= 0;
							done <= 1;
						   end					      

        default  :  state = s0;
        endcase

endmodule


