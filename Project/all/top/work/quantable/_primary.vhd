library verilog;
use verilog.vl_types.all;
entity quantable is
    port(
        enable_quant    : in     vl_logic;
        enable_y        : in     vl_logic;
        enable_cb       : in     vl_logic;
        enable_cr       : in     vl_logic;
        clk             : in     vl_logic;
        nrst            : in     vl_logic;
        enable_output   : out    vl_logic;
        enable_zzscan   : out    vl_logic;
        param_01        : out    vl_logic_vector(6 downto 0);
        param_02        : out    vl_logic_vector(6 downto 0);
        param_03        : out    vl_logic_vector(6 downto 0);
        param_04        : out    vl_logic_vector(6 downto 0);
        param_05        : out    vl_logic_vector(6 downto 0);
        param_06        : out    vl_logic_vector(6 downto 0);
        param_07        : out    vl_logic_vector(6 downto 0);
        param_08        : out    vl_logic_vector(6 downto 0)
    );
end quantable;
