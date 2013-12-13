library verilog;
use verilog.vl_types.all;
entity barrel_shifter is
    generic(
        REGSIZE         : integer := 64;
        SHIFTSIZE       : integer := 6
    );
    port(
        inreg           : in     vl_logic_vector;
        shsize          : in     vl_logic_vector;
        outreg          : out    vl_logic_vector
    );
end barrel_shifter;
