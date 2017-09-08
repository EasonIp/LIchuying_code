library verilog;
use verilog.vl_types.all;
entity control is
    generic(
        pword           : integer := 0;
        fword           : integer := 1
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        addr            : out    vl_logic_vector(7 downto 0)
    );
end control;
