library verilog;
use verilog.vl_types.all;
entity iic_noack is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        key_rd          : in     vl_logic;
        key_wr          : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        data_out        : out    vl_logic_vector(7 downto 0);
        scl             : out    vl_logic;
        sda             : inout  vl_logic
    );
end iic_noack;
