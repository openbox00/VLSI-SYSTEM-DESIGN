library verilog;
use verilog.vl_types.all;
entity sizetable is
    port(
        din             : in     vl_logic_vector(9 downto 0);
        size            : out    vl_logic_vector(3 downto 0)
    );
end sizetable;
