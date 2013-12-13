library verilog;
use verilog.vl_types.all;
entity lactable is
    port(
        run             : in     vl_logic_vector(3 downto 0);
        size            : in     vl_logic_vector(3 downto 0);
        code            : out    vl_logic_vector(15 downto 0);
        length          : out    vl_logic_vector(3 downto 0)
    );
end lactable;
