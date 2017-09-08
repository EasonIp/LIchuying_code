library verilog;
use verilog.vl_types.all;
entity pre_seg7 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        data            : in     vl_logic_vector(3 downto 0);
        flag            : in     vl_logic;
        data8           : out    vl_logic_vector(31 downto 0)
    );
end pre_seg7;
