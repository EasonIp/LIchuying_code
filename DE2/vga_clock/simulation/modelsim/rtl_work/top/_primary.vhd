library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        r               : out    vl_logic_vector(9 downto 0);
        g               : out    vl_logic_vector(9 downto 0);
        b               : out    vl_logic_vector(9 downto 0);
        hsync           : out    vl_logic;
        vsync           : out    vl_logic;
        VGA_CLK         : out    vl_logic;
        VGA_BLANK       : out    vl_logic;
        VGA_SYNC        : out    vl_logic
    );
end top;
