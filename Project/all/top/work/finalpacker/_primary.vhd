library verilog;
use verilog.vl_types.all;
entity finalpacker is
    generic(
        S0              : integer := 0;
        S1              : integer := 1;
        S2              : integer := 2;
        S3              : integer := 3;
        S4              : integer := 4;
        S5              : integer := 5;
        S6              : integer := 6
    );
    port(
        jpg_en          : in     vl_logic;
        jpg_out         : in     vl_logic_vector(31 downto 0);
        non_out         : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        nrst            : in     vl_logic;
        non_length      : in     vl_logic_vector(5 downto 0);
        frame_end       : in     vl_logic;
        JPEG_OUT        : out    vl_logic_vector(31 downto 0);
        final_enable    : out    vl_logic;
        total_finish    : out    vl_logic
    );
end finalpacker;
