library verilog;
use verilog.vl_types.all;
entity REGISTER_FILE is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        reg_rw          : in     vl_logic;
        reg_ena         : in     vl_logic;
        addr1           : in     vl_logic_vector(4 downto 0);
        addr2           : in     vl_logic_vector(4 downto 0);
        addr_dst        : in     vl_logic_vector(4 downto 0);
        write_data      : in     vl_logic_vector(31 downto 0);
        write_addr      : in     vl_logic_vector(4 downto 0);
        read_data1      : out    vl_logic_vector(31 downto 0);
        read_data2      : out    vl_logic_vector(31 downto 0);
        read_data3      : out    vl_logic_vector(31 downto 0)
    );
end REGISTER_FILE;
