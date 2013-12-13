library verilog;
use verilog.vl_types.all;
entity packer is
    port(
        clk             : in     vl_logic;
        nrst            : in     vl_logic;
        idle            : in     vl_logic;
        den             : in     vl_logic;
        dc              : in     vl_logic;
        eob             : in     vl_logic;
        lumenb          : in     vl_logic;
        chromenb_u      : in     vl_logic;
        chromenb_v      : in     vl_logic;
        din             : in     vl_logic_vector(9 downto 0);
        din_sign        : in     vl_logic;
        ldccode         : in     vl_logic_vector(8 downto 0);
        ldclength       : in     vl_logic_vector(3 downto 0);
        cdccode         : in     vl_logic_vector(10 downto 0);
        cdclength       : in     vl_logic_vector(3 downto 0);
        lcode           : in     vl_logic_vector(15 downto 0);
        ccode           : in     vl_logic_vector(15 downto 0);
        llength         : in     vl_logic_vector(3 downto 0);
        clength         : in     vl_logic_vector(3 downto 0);
        length_bit      : in     vl_logic_vector(4 downto 0);
        jpg_en          : out    vl_logic;
        jpg_out         : out    vl_logic_vector(31 downto 0);
        up_reg          : out    vl_logic_vector(31 downto 0);
        non_length      : out    vl_logic_vector(5 downto 0);
        busy            : out    vl_logic
    );
end packer;
