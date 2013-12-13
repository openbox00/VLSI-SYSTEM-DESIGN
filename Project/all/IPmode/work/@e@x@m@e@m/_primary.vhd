library verilog;
use verilog.vl_types.all;
entity EXMEM is
    port(
        datarw_out      : out    vl_logic;
        dataena_out     : out    vl_logic;
        address_out     : out    vl_logic_vector(19 downto 0);
        address_in      : in     vl_logic_vector(19 downto 0);
        datarw_in       : in     vl_logic;
        dataena_in      : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end EXMEM;
