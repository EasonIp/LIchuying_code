library verilog;
use verilog.vl_types.all;
entity LCD_TEST is
    generic(
        LCD_INTIAL      : integer := 0;
        LCD_LINE1       : integer := 5
    );
    port(
        iCLK            : in     vl_logic;
        iRST_N          : in     vl_logic;
        data_clk        : in     vl_logic_vector(31 downto 0);
        LCD_DATA        : out    vl_logic_vector(7 downto 0);
        LCD_RW          : out    vl_logic;
        LCD_EN          : out    vl_logic;
        LCD_RS          : out    vl_logic
    );
end LCD_TEST;
