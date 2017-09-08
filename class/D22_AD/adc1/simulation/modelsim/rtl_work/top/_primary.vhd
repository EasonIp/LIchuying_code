library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        adc_in          : in     vl_logic;
        cs_n            : out    vl_logic;
        adc_clk         : out    vl_logic;
        sel             : out    vl_logic_vector(2 downto 0);
        seg             : out    vl_logic_vector(7 downto 0)
    );
end top;
