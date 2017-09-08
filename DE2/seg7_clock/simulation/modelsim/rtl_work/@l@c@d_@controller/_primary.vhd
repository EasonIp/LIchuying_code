library verilog;
use verilog.vl_types.all;
entity LCD_Controller is
    generic(
        CLK_Divide      : integer := 16
    );
    port(
        iDATA           : in     vl_logic_vector(7 downto 0);
        iRS             : in     vl_logic;
        iStart          : in     vl_logic;
        oDone           : out    vl_logic;
        iCLK            : in     vl_logic;
        iRST_N          : in     vl_logic;
        LCD_DATA        : out    vl_logic_vector(7 downto 0);
        LCD_RW          : out    vl_logic;
        LCD_EN          : out    vl_logic;
        LCD_RS          : out    vl_logic
    );
end LCD_Controller;
