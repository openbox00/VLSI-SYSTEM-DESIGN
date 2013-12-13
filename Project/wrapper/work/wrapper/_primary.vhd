library verilog;
use verilog.vl_types.all;
entity wrapper is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        HADDR           : in     vl_logic_vector(31 downto 0);
        ready           : in     vl_logic;
        in_data         : in     vl_logic_vector(31 downto 0);
        out_data        : out    vl_logic_vector(31 downto 0);
        write           : out    vl_logic;
        IPdata_in       : out    vl_logic_vector(31 downto 0);
        IPdata_out      : in     vl_logic_vector(31 downto 0)
    );
end wrapper;
