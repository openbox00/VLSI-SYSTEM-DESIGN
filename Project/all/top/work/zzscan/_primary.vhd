library verilog;
use verilog.vl_types.all;
entity zzscan is
    generic(
        S0              : integer := 0;
        S1              : integer := 1;
        S2              : integer := 2;
        S3              : integer := 3;
        S4              : integer := 4;
        S5              : integer := 5;
        S6              : integer := 6;
        S7              : integer := 7;
        S8              : integer := 8;
        S9              : integer := 9;
        S13             : integer := 13
    );
    port(
        clk             : in     vl_logic;
        nrst            : in     vl_logic;
        in1             : in     vl_logic_vector(7 downto 0);
        in2             : in     vl_logic_vector(7 downto 0);
        in3             : in     vl_logic_vector(7 downto 0);
        in4             : in     vl_logic_vector(7 downto 0);
        in5             : in     vl_logic_vector(7 downto 0);
        in6             : in     vl_logic_vector(7 downto 0);
        in7             : in     vl_logic_vector(7 downto 0);
        in8             : in     vl_logic_vector(7 downto 0);
        valid           : in     vl_logic;
        zzout           : out    vl_logic_vector(7 downto 0);
        vlcden_i        : out    vl_logic
    );
end zzscan;
