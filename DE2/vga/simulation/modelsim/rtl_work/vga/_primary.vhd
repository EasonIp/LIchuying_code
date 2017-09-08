library verilog;
use verilog.vl_types.all;
entity vga is
    generic(
        ha              : integer := 128;
        hb              : integer := 88;
        hc              : integer := 800;
        hd              : integer := 40;
        he              : integer := 1056;
        va              : integer := 4;
        vb              : integer := 23;
        vc              : integer := 600;
        vd              : integer := 1;
        ve              : integer := 628
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        rgb30           : out    vl_logic_vector(29 downto 0);
        hsync           : out    vl_logic;
        vsync           : out    vl_logic
    );
end vga;
