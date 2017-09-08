library verilog;
use verilog.vl_types.all;
entity pre_seg7 is
    generic(
        T100ms          : integer := 5000000
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        BCD4            : out    vl_logic_vector(15 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of T100ms : constant is 1;
end pre_seg7;
