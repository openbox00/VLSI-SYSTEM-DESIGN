library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        write           : in     vl_logic;
        cpu_in          : in     vl_logic_vector(31 downto 0);
        ptr_out         : in     vl_logic_vector(16 downto 0);
        cpu_out         : out    vl_logic_vector(31 downto 0);
        out_ready       : out    vl_logic
    );
end controller;
