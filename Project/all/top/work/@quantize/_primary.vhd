library verilog;
use verilog.vl_types.all;
entity Quantize is
    port(
        clk             : in     vl_logic;
        nrst            : in     vl_logic;
        enable_y        : in     vl_logic;
        enable_cb       : in     vl_logic;
        enable_cr       : in     vl_logic;
        enable_quant    : in     vl_logic;
        input_01        : in     vl_logic_vector(11 downto 0);
        input_02        : in     vl_logic_vector(11 downto 0);
        input_03        : in     vl_logic_vector(11 downto 0);
        input_04        : in     vl_logic_vector(11 downto 0);
        input_05        : in     vl_logic_vector(11 downto 0);
        input_06        : in     vl_logic_vector(11 downto 0);
        input_07        : in     vl_logic_vector(11 downto 0);
        input_08        : in     vl_logic_vector(11 downto 0);
        enable_zzscan   : out    vl_logic;
        output_01       : out    vl_logic_vector(7 downto 0);
        output_02       : out    vl_logic_vector(7 downto 0);
        output_03       : out    vl_logic_vector(7 downto 0);
        output_04       : out    vl_logic_vector(7 downto 0);
        output_05       : out    vl_logic_vector(7 downto 0);
        output_06       : out    vl_logic_vector(7 downto 0);
        output_07       : out    vl_logic_vector(7 downto 0);
        output_08       : out    vl_logic_vector(7 downto 0);
        quant_cycle     : out    vl_logic_vector(14 downto 0)
    );
end Quantize;
