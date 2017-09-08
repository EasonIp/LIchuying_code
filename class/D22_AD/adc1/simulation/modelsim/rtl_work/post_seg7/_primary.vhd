library verilog;
use verilog.vl_types.all;
entity post_seg7 is
    port(
        sel             : in     vl_logic_vector(2 downto 0);
        seg_o           : in     vl_logic_vector(7 downto 0);
        seg             : out    vl_logic_vector(7 downto 0)
    );
end post_seg7;
