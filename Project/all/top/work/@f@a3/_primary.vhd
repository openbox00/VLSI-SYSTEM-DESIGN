library verilog;
use verilog.vl_types.all;
entity FA3 is
    port(
        xin             : in     vl_logic;
        yin             : in     vl_logic;
        zin             : in     vl_logic;
        cout            : out    vl_logic
    );
end FA3;
