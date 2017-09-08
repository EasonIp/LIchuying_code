library verilog;
use verilog.vl_types.all;
entity clock_controller is
    generic(
        T10ms           : integer := 250000
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        data            : out    vl_logic_vector(31 downto 0)
    );
end clock_controller;
