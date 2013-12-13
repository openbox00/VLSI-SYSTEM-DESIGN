`timescale 1ns/10ps

module REGISTER_FILE(clk, rst, reg_rw, reg_ena, addr1, addr2, addr_dst, write_data, write_addr, read_data1, read_data2, read_data3);

input clk;
input rst;
input reg_rw;
input reg_ena;
input [4:0] addr1;
input [4:0] addr2;
input [4:0] addr_dst;
input [31:0] write_data;
input [4:0]	write_addr;

output  [31:0] read_data1;
output  [31:0] read_data2;
output  [31:0] read_data3;

reg [31:0] regs [31:0];

integer i;

always@(posedge clk or negedge rst)
begin
	if(!rst) begin
		for(i=0; i<32; i=i+1)
		regs[i] <= 32'd0;
		
	end
	else if(reg_rw) regs[write_addr] <= write_data;
	
end

assign	read_data1 = (reg_ena)?regs[addr1]:32'd0;
assign	read_data2 = (reg_ena)?regs[addr2]:32'd0;
assign	read_data3 = (reg_ena)?regs[addr_dst]:32'd0;

endmodule
