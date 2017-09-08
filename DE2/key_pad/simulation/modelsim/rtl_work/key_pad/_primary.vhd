library verilog;
use verilog.vl_types.all;
entity key_pad is
    generic(
        T1ms            : integer := 50000;
        NUM_KEY         : integer := 20
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        col             : out    vl_logic_vector(3 downto 0);
        row             : in     vl_logic_vector(3 downto 0);
        data            : out    vl_logic_vector(3 downto 0);
        flag            : out    vl_logic
    );
end key_pad;
