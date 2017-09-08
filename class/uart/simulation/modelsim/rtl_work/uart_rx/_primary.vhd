library verilog;
use verilog.vl_types.all;
entity uart_rx is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        rs232_rx        : in     vl_logic;
        rx_sel_data     : in     vl_logic;
        rx_num          : in     vl_logic_vector(3 downto 0);
        rx_en           : out    vl_logic;
        tx_en           : out    vl_logic;
        rx_d            : out    vl_logic_vector(7 downto 0)
    );
end uart_rx;
