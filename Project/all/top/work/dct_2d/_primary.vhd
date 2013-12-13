library verilog;
use verilog.vl_types.all;
entity dct_2d is
    generic(
        front8          : integer := 0;
        back8           : integer := 1
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        enable          : in     vl_logic;
        in0             : in     vl_logic_vector(11 downto 0);
        in1             : in     vl_logic_vector(11 downto 0);
        in2             : in     vl_logic_vector(11 downto 0);
        in3             : in     vl_logic_vector(11 downto 0);
        in4             : in     vl_logic_vector(11 downto 0);
        in5             : in     vl_logic_vector(11 downto 0);
        in6             : in     vl_logic_vector(11 downto 0);
        in7             : in     vl_logic_vector(11 downto 0);
        out_en          : out    vl_logic;
        out0            : out    vl_logic_vector(11 downto 0);
        out1            : out    vl_logic_vector(11 downto 0);
        out2            : out    vl_logic_vector(11 downto 0);
        out3            : out    vl_logic_vector(11 downto 0);
        out4            : out    vl_logic_vector(11 downto 0);
        out5            : out    vl_logic_vector(11 downto 0);
        out6            : out    vl_logic_vector(11 downto 0);
        out7            : out    vl_logic_vector(11 downto 0)
    );
end dct_2d;
