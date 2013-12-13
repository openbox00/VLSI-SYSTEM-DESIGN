//MEM/WB
`timescale 1ns/10ps
module MEMWB(sel_wb_out, reg_rw_out, addr_dst_out, alu_result_out, data_out_out
			, alu_result_in, sel_wb_in, reg_rw_in, addr_dst_in, data_out_in, clk, rst);

input sel_wb_in;
input reg_rw_in;

input [4:0] addr_dst_in;
input [31:0] alu_result_in;
input [31:0] data_out_in;
input clk;
input rst;


output reg	sel_wb_out;
output reg	reg_rw_out;

output reg	[4:0] addr_dst_out;
output reg	[31:0] alu_result_out;
output reg	[31:0] data_out_out;

always @ (posedge clk or negedge rst)
begin
	if (!rst) begin
		sel_wb_out = 0;
		reg_rw_out = 0;

		alu_result_out = 32'd0;
		data_out_out = 32'd0;
		addr_dst_out = 5'd0;
		end

		else begin
		sel_wb_out = sel_wb_in;
		reg_rw_out = reg_rw_in;

		alu_result_out = alu_result_in;
		data_out_out = data_out_in;
		addr_dst_out = addr_dst_in;
		end
	end


endmodule
