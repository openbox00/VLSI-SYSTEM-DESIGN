library verilog;
use verilog.vl_types.all;
entity MEMWB is
    port(
        sel_wb_out      : out    vl_logic;
        reg_rw_out      : out    vl_logic;
        addr_dst_out    : out    vl_logic_vector(4 downto 0);
        alu_result_out  : out    vl_logic_vector(31 downto 0);
        data_out_out    : out    vl_logic_vector(31 downto 0);
        alu_result_in   : in     vl_logic_vector(31 downto 0);
        sel_wb_in       : in     vl_logic;
        reg_rw_in       : in     vl_logic;
        addr_dst_in     : in     vl_logic_vector(4 downto 0);
        data_out_in     : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end MEMWB;
