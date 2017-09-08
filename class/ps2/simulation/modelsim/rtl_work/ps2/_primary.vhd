library verilog;
use verilog.vl_types.all;
entity ps2 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        ps2_clk         : in     vl_logic;
        ps2_data_in     : in     vl_logic;
        ps2_data_out    : out    vl_logic_vector(7 downto 0);
        valid           : out    vl_logic
    );
end ps2;
