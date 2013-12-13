library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        alu_result      : out    vl_logic_vector(31 downto 0);
        alu_overflow    : out    vl_logic;
        scr1            : in     vl_logic_vector(31 downto 0);
        scr2            : in     vl_logic_vector(31 downto 0);
        opcode          : in     vl_logic_vector(5 downto 0);
        sub_opcode      : in     vl_logic_vector(4 downto 0);
        enable_execute  : in     vl_logic;
        reset           : in     vl_logic
    );
end alu;
