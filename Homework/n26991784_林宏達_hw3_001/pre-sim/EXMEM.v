//EX/MEM
`timescale 1ns/10ps
module EXMEM(ena_data_out, data_rw_out, sel_wb_out, reg_rw_out, alu_result_out, read_data3_out, addr_dst_out
			, ena_data_in, data_rw_in, sel_wb_in, reg_rw_in, alu_result_in, read_data3_in, addr_dst_in, clk, rst);

input ena_data_in;
input data_rw_in;
input sel_wb_in;
input reg_rw_in;
input [31:0] alu_result_in;
input [31:0] read_data3_in;

input [4:0] addr_dst_in;
input clk;
input rst;


output reg	ena_data_out;
output reg	data_rw_out;
output reg	sel_wb_out;
output reg	reg_rw_out;
output reg	[31:0] alu_result_out;
output reg	[31:0] read_data3_out;

output reg	[4:0] addr_dst_out;

always @ (posedge clk or negedge rst)
begin
	if (!rst) begin
		ena_data_out = 0;
		data_rw_out = 0;
		sel_wb_out = 0;
		reg_rw_out = 0;
		alu_result_out = 32'd0;
		read_data3_out = 32'd0;
		
		addr_dst_out = 5'd0;
		end
	else begin

		ena_data_out = ena_data_in;
		data_rw_out = data_rw_in;
		sel_wb_out = sel_wb_in;
		reg_rw_out = reg_rw_in;
		alu_result_out = alu_result_in;
		read_data3_out = read_data3_in;
		
		addr_dst_out = addr_dst_in;
		end
end


endmodule
