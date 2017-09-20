
///////MUX1宏定义/////////
`define SEL_MUX1_R0 3'b000
`define SEL_MUX1_R1 3'b001
`define SEL_MUX1_R2 3'b010
`define SEL_MUX1_R3 3'b011
`define SEL_MUX1_PC 3'b100

///////MUX2宏定义/////////
`define SEL_MUX2_ALU		2'b00
`define SEL_MUX2_BUS1	2'b01
`define SEL_MUX2_MEM		2'b10

///////指令宏定义/////////
`define NOP	4'b0000
`define ADD	4'b0001
`define SUB	4'b0010
`define AND	4'b0011
`define NOT	4'b0100
`define RD	4'b0101
`define WR	4'b0110
`define BR	4'b0111
`define BRZ	4'b1000
`define HLT	4'b1111

///////复位向量/////////
`define RESET_VECTOR   8'h00

///////中断向量/////////
`define INTERRUPT_VECTOR 8'h80


