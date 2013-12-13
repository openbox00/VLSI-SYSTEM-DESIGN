library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        ls_w_mode       : in     vl_logic;
        funct           : in     vl_logic_vector(3 downto 0);
        sv              : in     vl_logic_vector(1 downto 0);
        source1         : in     vl_logic_vector(31 downto 0);
        source2         : in     vl_logic_vector(31 downto 0);
        over_flow       : out    vl_logic;
        alu_result      : out    vl_logic_vector(31 downto 0)
    );
end ALU;
