library verilog;
use verilog.vl_types.all;
entity dds is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        num             : out    vl_logic_vector(7 downto 0)
    );
end dds;
