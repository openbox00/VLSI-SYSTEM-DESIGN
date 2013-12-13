library verilog;
use verilog.vl_types.all;
entity Entropy is
    port(
        clk             : in     vl_logic;
        nrst            : in     vl_logic;
        entropy_in      : in     vl_logic_vector(7 downto 0);
        entropy_ena     : in     vl_logic;
        lumenb_in       : in     vl_logic;
        chromenb_uin    : in     vl_logic;
        chromenb_vin    : in     vl_logic;
        JPEG_OUT        : out    vl_logic_vector(31 downto 0);
        total_finish    : out    vl_logic;
        final_enable    : out    vl_logic;
        busy            : out    vl_logic;
        frame_count     : out    vl_logic_vector(11 downto 0);
        jpg_en          : out    vl_logic;
        jpg_out         : out    vl_logic_vector(31 downto 0);
        entropy_cycle   : out    vl_logic_vector(14 downto 0);
        co_cycle        : out    vl_logic_vector(14 downto 0)
    );
end Entropy;
