library verilog;
use verilog.vl_types.all;
entity uart_tx is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        tx_sel_data     : in     vl_logic;
        tx_num          : in     vl_logic_vector(3 downto 0);
        tx_d            : in     vl_logic_vector(7 downto 0);
        rs232_tx        : out    vl_logic
    );
end uart_tx;
