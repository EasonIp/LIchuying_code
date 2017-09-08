library verilog;
use verilog.vl_types.all;
entity divider2 is
    generic(
        WIDTH           : integer := 5
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        clk_out         : out    vl_logic
    );
end divider2;
