library verilog;
use verilog.vl_types.all;
entity fifo is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        q               : out    vl_logic_vector(7 downto 0)
    );
end fifo;
