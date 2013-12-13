library verilog;
use verilog.vl_types.all;
entity yuv_buffer is
    generic(
        out_Y           : integer := 0;
        out_Cb          : integer := 1;
        out_Cr          : integer := 2
    );
    port(
        data_out        : out    vl_logic_vector(95 downto 0);
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        data_select     : in     vl_logic_vector(1 downto 0);
        write_read      : in     vl_logic;
        Y_in            : in     vl_logic_vector(15 downto 0);
        Cb_in           : in     vl_logic_vector(15 downto 0);
        Cr_in           : in     vl_logic_vector(15 downto 0);
        addr_in         : in     vl_logic_vector(18 downto 0);
        addr_out        : in     vl_logic_vector(18 downto 0)
    );
end yuv_buffer;
