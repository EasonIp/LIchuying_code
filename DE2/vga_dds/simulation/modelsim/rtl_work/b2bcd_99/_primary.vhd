library verilog;
use verilog.vl_types.all;
entity b2bcd_99 is
    port(
        din             : in     vl_logic_vector(7 downto 0);
        dout            : out    vl_logic_vector(7 downto 0)
    );
end b2bcd_99;
