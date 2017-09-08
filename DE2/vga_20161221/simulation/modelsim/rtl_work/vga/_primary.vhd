library verilog;
use verilog.vl_types.all;
entity vga is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        r               : out    vl_logic_vector(2 downto 0);
        g               : out    vl_logic_vector(2 downto 0);
        b               : out    vl_logic_vector(1 downto 0);
        hsync           : out    vl_logic;
        vsync           : out    vl_logic
    );
end vga;
