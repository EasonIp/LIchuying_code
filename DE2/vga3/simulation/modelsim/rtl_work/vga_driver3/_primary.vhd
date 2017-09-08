library verilog;
use verilog.vl_types.all;
entity vga_driver3 is
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
        en              : out    vl_logic_vector(7 downto 0);
        hsync           : out    vl_logic;
        vsync           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ha : constant is 1;
    attribute mti_svvh_generic_type of hb : constant is 1;
    attribute mti_svvh_generic_type of hc : constant is 1;
    attribute mti_svvh_generic_type of hd : constant is 1;
    attribute mti_svvh_generic_type of he : constant is 1;
    attribute mti_svvh_generic_type of va : constant is 1;
    attribute mti_svvh_generic_type of vb : constant is 1;
    attribute mti_svvh_generic_type of vc : constant is 1;
    attribute mti_svvh_generic_type of vd : constant is 1;
    attribute mti_svvh_generic_type of ve : constant is 1;
end vga_driver3;
