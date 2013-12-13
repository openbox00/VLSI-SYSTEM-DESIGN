`timescale 1ns/10ps

module REGISTER_FILE(clk, rst_n, rw_ena, addr1, addr2, addr_dst, write_data, read_data1, read_data2, read_data3);
input clk, rst_n, rw_ena;
input [4:0] addr1, addr2, addr_dst;
input [31:0] write_data;
output reg [31:0] read_data1, read_data2, read_data3;

reg [31:0] regs [31:0];

integer i;

always@(posedge clk)
begin
	if(!rst_n) begin
		for(i=0; i<32; i=i+1) regs[i] <= 32'd0;
		read_data1 <= 32'd0;
		read_data2 <= 32'd0;
		read_data3 <= 32'd0;
	end
	else if(rw_ena) regs[addr_dst] <= write_data;
	else begin
			read_data1 <= regs[addr1];
			read_data2 <= regs[addr2];
			read_data3 <= regs[addr_dst];
	end	
end


endmodule
