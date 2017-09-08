library verilog;
use verilog.vl_types.all;
entity rgb is
    port(
        en              : in     vl_logic_vector(7 downto 0);
        r               : out    vl_logic_vector(2 downto 0);
        g               : out    vl_logic_vector(2 downto 0);
        b               : out    vl_logic_vector(1 downto 0)
    );
end rgb;
