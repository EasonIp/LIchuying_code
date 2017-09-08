library verilog;
use verilog.vl_types.all;
entity ram_controller is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        wren            : out    vl_logic;
        addr            : out    vl_logic_vector(7 downto 0);
        data            : out    vl_logic_vector(7 downto 0)
    );
end ram_controller;
