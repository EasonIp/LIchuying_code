library verilog;
use verilog.vl_types.all;
entity pll is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        clk_25M         : out    vl_logic;
        clk_100M        : out    vl_logic;
        locked          : out    vl_logic
    );
end pll;
