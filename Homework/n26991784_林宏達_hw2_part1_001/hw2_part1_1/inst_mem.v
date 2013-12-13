module INST_MEM (clk, rst_n, addr, fetch_ena, inst_out);
parameter IM_SIZE = 32;
input clk, rst_n, fetch_ena;
input [4:0] addr;
output reg [31:0] inst_out;

reg [31:0] inst [IM_SIZE-1:0];
integer i;

always@(posedge clk)
begin
	if(!rst_n) inst_out <= 32'd0;
	else if(fetch_ena)inst_out <= inst[addr];
end

endmodule
