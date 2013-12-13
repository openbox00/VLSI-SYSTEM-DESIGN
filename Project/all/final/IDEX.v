//ID/EX
`timescale 1ns/10ps
module IDEX(ls_w_mode_out, funct_out, sel_in2_out, ena_data_out, data_rw_out, sel_wb_out, reg_rw_out, read_data1_out
			, read_data2_out, read_data3_out, ext_out , addr_dst_out
			, ls_w_mode_in, funct_in, sel_in2_in, ena_data_in, data_rw_in, sel_wb_in, reg_rw_in, read_data1_in, read_data2_in, addr_dst_in
			, read_data3_in, ext_in, clk, rst, addr1_out, addr1_in, addr2_out, addr2_in, inst_out, inst_in, sel_alu_out, sel_alu_in );

input ls_w_mode_in;
input [3:0] funct_in;
input sel_in2_in;
input ena_data_in;
input data_rw_in;
input sel_wb_in;
input reg_rw_in;
input [4:0] addr_dst_in;
input [4:0] addr1_in;
input [4:0] addr2_in;

input sel_alu_in;
input [31:0] inst_in;
input [31:0] read_data1_in;
input [31:0] read_data2_in;
input [31:0] read_data3_in;
input [31:0] ext_in;
input clk;
input rst;


output reg sel_alu_out;
output reg  [31:0] inst_out;
output reg  [4:0] addr1_out;
output reg  [4:0] addr2_out;
output reg	ls_w_mode_out;
output reg	[3:0] funct_out;
output reg	sel_in2_out;
output reg	ena_data_out;
output reg	data_rw_out;
output reg	sel_wb_out;
output reg	reg_rw_out;
output reg	[4:0] addr_dst_out;

output reg	[31:0] read_data1_out;
output reg	[31:0] read_data2_out;
output reg	[31:0] read_data3_out;
output reg	[31:0] ext_out;


always @ (posedge clk or negedge rst)
begin
	if (!rst) begin
		ls_w_mode_out = 0;
		funct_out = 4'd0;
		sel_in2_out = 0;
		ena_data_out = 0;
		data_rw_out = 0;
		sel_wb_out = 0;
		reg_rw_out = 0;		
		read_data1_out = 32'd0;
		read_data2_out = 32'd0;
		read_data3_out = 32'd0;
		ext_out = 32'd0;
		addr_dst_out = 5'd0;
		addr1_out = 5'd0;
        addr2_out = 5'd0;
		inst_out = 32'd0;
		sel_alu_out = 0;
		end

		else begin
		ls_w_mode_out = ls_w_mode_in;
		funct_out = funct_in;
		sel_in2_out = sel_in2_in;
		ena_data_out = ena_data_in;
		data_rw_out = data_rw_in;
		sel_wb_out = sel_wb_in;
		reg_rw_out = reg_rw_in;	
		read_data1_out = read_data1_in;
		read_data2_out = read_data2_in;
		read_data3_out = read_data3_in;
		ext_out = ext_in;
		addr_dst_out = addr_dst_in;
		addr1_out = addr1_in;
        addr2_out = addr2_in;
		inst_out = inst_in;
		sel_alu_out= sel_alu_in;
		end
	end


endmodule
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		