library verilog;
use verilog.vl_types.all;
entity key_flag is
    generic(
        MASK_TIME       : integer := 500000
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        key_n           : in     vl_logic;
        key_out         : out    vl_logic
    );
end key_flag;
