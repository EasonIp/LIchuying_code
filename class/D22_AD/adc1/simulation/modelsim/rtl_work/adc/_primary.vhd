library verilog;
use verilog.vl_types.all;
entity adc is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        sid             : in     vl_logic;
        adc_clk         : out    vl_logic;
        cs_n            : out    vl_logic;
        data            : out    vl_logic_vector(7 downto 0)
    );
end adc;
