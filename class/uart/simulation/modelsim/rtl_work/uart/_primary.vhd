library verilog;
use verilog.vl_types.all;
entity uart is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        rs232_rx        : in     vl_logic;
        rs232_tx        : out    vl_logic
    );
end uart;
