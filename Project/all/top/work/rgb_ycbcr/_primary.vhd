library verilog;
use verilog.vl_types.all;
entity rgb_ycbcr is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        in_data         : in     vl_logic_vector(23 downto 0);
        Y               : out    vl_logic_vector(15 downto 0);
        Cb              : out    vl_logic_vector(15 downto 0);
        Cr              : out    vl_logic_vector(15 downto 0);
        enable          : out    vl_logic
    );
end rgb_ycbcr;
