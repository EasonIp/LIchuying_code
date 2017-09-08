library verilog;
use verilog.vl_types.all;
entity div_freq is
    generic(
        HW              : integer := 50;
        LW              : integer := 50
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        clk_out         : out    vl_logic
    );
end div_freq;
