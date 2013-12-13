library verilog;
use verilog.vl_types.all;
entity MEMWB is
    port(
        data_out        : out    vl_logic_vector(31 downto 0);
        data_in         : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end MEMWB;
