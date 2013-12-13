library verilog;
use verilog.vl_types.all;
entity DATA_MEM is
    generic(
        data_size       : integer := 32;
        addr_size       : integer := 18;
        mem_width       : integer := 8;
        mem_size        : integer := 262144
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        data_rw         : in     vl_logic;
        ena_data        : in     vl_logic;
        addr            : in     vl_logic_vector;
        data_in         : in     vl_logic_vector(31 downto 0);
        data_out        : out    vl_logic_vector
    );
end DATA_MEM;
