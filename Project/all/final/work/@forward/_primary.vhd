library verilog;
use verilog.vl_types.all;
entity Forward is
    port(
        forwardA        : out    vl_logic_vector(1 downto 0);
        forwardB        : out    vl_logic_vector(1 downto 0);
        addr2_out       : in     vl_logic_vector(4 downto 0);
        addr1_out       : in     vl_logic_vector(4 downto 0);
        addr_dst_reg_out: in     vl_logic_vector(4 downto 0);
        addr_dst_reg2_out: in     vl_logic_vector(4 downto 0);
        reg_rw_out_exe  : in     vl_logic;
        reg_rw_out_mem  : in     vl_logic;
        data_rw_reg_out : in     vl_logic;
        sel_data_in     : out    vl_logic;
        addr_dst        : in     vl_logic_vector(4 downto 0);
        addr1           : in     vl_logic_vector(4 downto 0);
        branch_ena      : in     vl_logic;
        sel_data1       : out    vl_logic_vector(1 downto 0);
        sel_data3       : out    vl_logic_vector(1 downto 0);
        addr_dst_out    : in     vl_logic_vector(4 downto 0);
        addr2           : in     vl_logic_vector(4 downto 0);
        sel_data2_in    : out    vl_logic;
        sel_data1_in    : out    vl_logic
    );
end Forward;
