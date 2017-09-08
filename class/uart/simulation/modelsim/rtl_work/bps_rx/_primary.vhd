library verilog;
use verilog.vl_types.all;
entity bps_rx is
    generic(
        bps_div         : vl_logic_vector(0 to 12) := (Hi1, Hi0, Hi1, Hi0, Hi0, Hi0, Hi1, Hi0, Hi1, Hi1, Hi0, Hi0, Hi0);
        bps_div_2       : vl_logic_vector(0 to 12) := (Hi0, Hi1, Hi0, Hi1, Hi0, Hi0, Hi0, Hi1, Hi0, Hi1, Hi1, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        rx_en           : in     vl_logic;
        rx_sel_data     : out    vl_logic;
        rx_num          : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bps_div : constant is 1;
    attribute mti_svvh_generic_type of bps_div_2 : constant is 1;
end bps_rx;
