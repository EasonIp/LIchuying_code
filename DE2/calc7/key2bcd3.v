module key2bcd3 (clk, 
              rst_n, 
              real_number, 
              opcode, 
              BCDa, 
              BCDb, 
              result );  //改动1：修改模块名
	
	input [4:0] real_number;
	input rst_n,clk;
	input [20:0] result;	
	
	output reg [20:0] BCDa,BCDb;
	output reg [3:0] opcode;
	
	reg [3:0] opcode_reg;
	reg [3:0] state;
	reg datacoming_state,datacoming_flag;
	

	always @(posedge clk)
    if (!rst_n)
    begin
		datacoming_state <=0;
		datacoming_flag <=0;
    end
    else
	  if (real_number!=17)    
      case(datacoming_state)
       0: begin       	     
				datacoming_flag <=1;
				datacoming_state <=1;
       	  end
       1: begin
				datacoming_flag  <=0;
				datacoming_state <=1;
          end
		endcase
		else
		begin
			datacoming_state <= 0;
			datacoming_flag <= 0;
		end
//改动2：状态机修改，加入正负数切换按键	
	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
		begin
			BCDa <= 0;
			BCDb <= 0;
			state <= 0;
			opcode <= 0;
		end	
		else
		if(datacoming_flag)
		begin
			case(state)
				0:	case(real_number)
					0,1,2,3,4,5,6,7,8,9:
					begin
						BCDa[19:0] <= {BCDa[15:0],real_number[3:0]};
						state <= 0;
					end
					10,11,12,13:	
					begin
						opcode_reg <= real_number[3:0];	
						state <= 1;
					end
					15:	//符号位取反
					begin
						state <= 0;
						BCDa[20] = ~BCDa[20];
					end
					default:state <= 0;
					endcase
					
				1:	case(real_number)
					0,1,2,3,4,5,6,7,8,9:
					begin
						opcode <= opcode_reg;	
						BCDb[19:0] <= {BCDb[15:0],real_number[3:0]};
						state <= 1;
					end
					10,11,12,13:
					if(BCDb!=0)
					begin
						opcode_reg <= real_number[3:0];
						state <= 3;
						BCDb <= 0;
						BCDa <= result;
					end
					else
					begin
						state <= 1;
						opcode_reg <= real_number[3:0];
					end
					14:		
					begin
						BCDa <= result;	
						BCDb <= 0;		
						state <= 2;
					end
					15:	//符号位取反
					begin
						state <= 1;
						BCDb[20] = ~BCDb[20];
					end
					default:state <= 1;
					endcase
				
				2: case(real_number)	
					0,1,2,3,4,5,6,7,8,9:	
					begin
						BCDa <= real_number;
						BCDb <= 0;
						state <= 0;
					end
					10,11,12,13:	
					begin
						opcode_reg <= real_number[3:0];
						state <= 1;
					end
					15:	//符号位取反
					begin
						state <= 2;
						BCDa[20] = ~BCDa[20];
					end
					default:state <= 2;
					endcase
					
				3: case(real_number)	
					0,1,2,3,4,5,6,7,8,9:	
					begin
						BCDb <= real_number;
						state <= 1;
						opcode <= opcode_reg;
					end
					10,11,12,13:
					begin
						opcode_reg <= real_number[3:0];
						state <= 3;
					end
					15:	//符号位取反
					begin
						state <= 3;
						BCDb[20] = ~BCDa[20];
					end
					default:state <= 3;
					endcase
				
				default : state <= 0;
			endcase
		end
	end

endmodule
