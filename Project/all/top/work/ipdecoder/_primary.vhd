library verilog;
use verilog.vl_types.all;
entity ipdecoder is
    port(
        datarw          : out    vl_logic;
        dataena         : out    vl_logic;
        IP_write        : out    vl_logic;
        opcode          : in     vl_logic_vector(5 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end ipdecoder;
