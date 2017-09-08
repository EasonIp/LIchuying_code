library verilog;
use verilog.vl_types.all;
entity fifo_read is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        rdfull          : in     vl_logic;
        rdempty         : in     vl_logic;
        rdreq           : out    vl_logic
    );
end fifo_read;
