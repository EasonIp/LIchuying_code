library verilog;
use verilog.vl_types.all;
entity ledrun is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        led             : out    vl_logic_vector(3 downto 0)
    );
end ledrun;
