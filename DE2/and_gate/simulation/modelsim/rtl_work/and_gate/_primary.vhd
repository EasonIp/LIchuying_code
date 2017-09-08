library verilog;
use verilog.vl_types.all;
entity and_gate is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic;
        f               : out    vl_logic
    );
end and_gate;
