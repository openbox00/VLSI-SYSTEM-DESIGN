library verilog;
use verilog.vl_types.all;
entity EXMEM is
    port(
        ena_data_out    : out    vl_logic;
        data_rw_out     : out    vl_logic;
        sel_wb_out      : out    vl_logic;
        reg_rw_out      : out    vl_logic;
        alu_result_out  : out    vl_logic_vector(31 downto 0);
        read_data3_out  : out    vl_logic_vector(31 downto 0);
        addr_dst_out    : out    vl_logic_vector(4 downto 0);
        ena_data_in     : in     vl_logic;
        data_rw_in      : in     vl_logic;
        sel_wb_in       : in     vl_logic;
        reg_rw_in       : in     vl_logic;
        alu_result_in   : in     vl_logic_vector(31 downto 0);
        read_data3_in   : in     vl_logic_vector(31 downto 0);
        addr_dst_in     : in     vl_logic_vector(4 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end EXMEM;
