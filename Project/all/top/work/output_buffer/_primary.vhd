library verilog;
use verilog.vl_types.all;
entity output_buffer is
    generic(
        out_Y           : integer := 0;
        out_Cb          : integer := 1;
        out_Cr          : integer := 2
    );
    port(
        data_out        : out    vl_logic_vector(31 downto 0);
        output_valid    : out    vl_logic;
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        write_en        : in     vl_logic;
        data_in         : in     vl_logic_vector(31 downto 0);
        ptr_out         : in     vl_logic_vector(16 downto 0)
    );
end output_buffer;
