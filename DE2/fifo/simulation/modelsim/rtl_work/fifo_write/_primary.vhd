library verilog;
use verilog.vl_types.all;
entity fifo_write is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        wrfull          : in     vl_logic;
        wrempty         : in     vl_logic;
        wrreq           : out    vl_logic;
        data            : out    vl_logic_vector(7 downto 0)
    );
end fifo_write;
