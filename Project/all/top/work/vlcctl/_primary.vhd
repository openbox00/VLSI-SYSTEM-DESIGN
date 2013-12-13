library verilog;
use verilog.vl_types.all;
entity vlcctl is
    port(
        clk             : in     vl_logic;
        nrst            : in     vl_logic;
        dqin            : in     vl_logic_vector(7 downto 0);
        den             : in     vl_logic;
        lumenb_in       : in     vl_logic;
        chromenb_uin    : in     vl_logic;
        chromenb_vin    : in     vl_logic;
        lumenb          : out    vl_logic;
        chromenb_u      : out    vl_logic;
        chromenb_v      : out    vl_logic;
        idle            : out    vl_logic;
        dc              : out    vl_logic;
        eob             : out    vl_logic;
        dcsize          : out    vl_logic_vector(3 downto 0);
        vlcdeno         : out    vl_logic;
        unsg_dout       : out    vl_logic_vector(9 downto 0);
        sign            : out    vl_logic;
        frame_end       : out    vl_logic;
        length_bit      : out    vl_logic_vector(4 downto 0);
        lrun            : out    vl_logic_vector(3 downto 0);
        lsize           : out    vl_logic_vector(3 downto 0);
        crun            : out    vl_logic_vector(3 downto 0);
        csize           : out    vl_logic_vector(3 downto 0);
        frame_count     : out    vl_logic_vector(11 downto 0);
        entropy_cycle   : out    vl_logic_vector(14 downto 0);
        co_cycle        : out    vl_logic_vector(14 downto 0)
    );
end vlcctl;
