library verilog;
use verilog.vl_types.all;
entity HA1 is
    port(
        xin             : in     vl_logic;
        yin             : in     vl_logic;
        sout            : out    vl_logic;
        cout            : out    vl_logic
    );
end HA1;
