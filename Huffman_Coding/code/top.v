/************************************************
*             霍夫曼编码机by李佳泽              *
*************************************************/
`timescale   1ns/1ns

module top
      (
      input   wire          clk,
		input   wire          rst,
		input   wire          start,
		input   wire  [7:0]   indata,
		input   wire  [5:0]   addr,
		output  wire          done,
	   output  wire  [7:0]   out_result  ,    
	   output  wire  [2:0]   out_L       ,
	   output  wire  [7:0]   out_W       
		);

		

wire [14:0]  group_data;
wire [5:0]   gnumber;
wire [5:0]   sp;
wire [8:0]   result_data;
wire [8:0]   Ldata;
wire [8:0]   Rdata;
wire [8:0]   Ddata;
wire         down;
wire         rd;
wire         up;		
		
group G
      (
      .clk       (clk       ),
		.rst       (rst       ),
		.start     (start     ),
		.group_in  (indata    ),
		.sp        (sp        ),
		.gnumber   (gnumber   ),
		.group_data(group_data)
		);		

fsmd F
   (
    .clk         (clk        ), 
    .rst         (rst        ),
    .start       (start      ),
	 .gnumber     (gnumber    ),
	 .result_data (result_data),
    .Ldata       (Ldata      ),
    .Rdata       (Rdata      ),
	 .addr        (addr       ),
    .Ddata       (Ddata      ),
    .done        (done       ),
    .down        (down       ),
    .rd          (rd         ),
    .up          (up         ),
	 .out_result  (out_result ),    
	 .out_L       (out_L      ),
	 .out_W       (out_W      )	 
   );

	
collator C
      (
      .clk        (clk        ),
		.rst        (rst        ),
		.up         (up         ),
		.down       (down       ),
		.rd         (rd         ),
		.group_data (group_data ),
		.result_data(result_data),
      .Ldata      (Ldata      ),
      .Rdata      (Rdata      ),
      .Ddata      (Ddata      ),
		.sp         (sp         )
		);		

endmodule
