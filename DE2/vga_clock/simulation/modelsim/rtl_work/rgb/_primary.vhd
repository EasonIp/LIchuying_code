library verilog;
use verilog.vl_types.all;
entity rgb is
    port(
        rgb30           : in     vl_logic_vector(29 downto 0);
        r               : out    vl_logic_vector(9 downto 0);
        g               : out    vl_logic_vector(9 downto 0);
        b               : out    vl_logic_vector(9 downto 0)
    );
end rgb;
