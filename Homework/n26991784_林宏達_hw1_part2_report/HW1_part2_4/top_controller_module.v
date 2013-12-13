//top_module_controller

`timescale 1ns/10ps


module top_module_controller(alu_overflow,ir,clk,reset);
	output alu_overflow;
	input [31:0] ir;
	input clk,reset;
	
	wire [4:0] read_address1 = ir[19:15];
	wire [4:0] read_address2 = ir[14:10];
	wire [4:0] write_address = ir[24:20];
	wire [19:0] immediate = ir[19:0];
	wire [5:0] opcode = ir[30:25];
	wire [4:0] sub_opcode = ir[4:0];
	
	wire [31:0] src1;
	wire [31:0] read_data2;
	wire [31:0] src2;
	wire [31:0] alu_result;
	wire [31:0] mux2to1_result;
	wire [19:0] mux5to1_result;
	wire [31:0] sign_out;
	wire read,write;
	wire [2:0] mux5to1_select;
	wire imm_reg_select;
	wire mux2to1_select;
	wire enable_execute;
	wire [31:0] write_data;
	
buffer buff(write_data,mux2to1_result,write);
regfile register(src1,read_data2,read_address1,read_address2,write_address,write_data,clk,reset,read,write);
imm_reg_select imm_reg(src2,read_data2,sign_out,imm_reg_select);
sign_extend sign(sign_out,mux5to1_result);
mux5to1_select mux5to1(mux5to1_result,immediate,mux5to1_select);
alu alu_m1(alu_result,alu_overflow,src1,src2,opcode,sub_opcode,enable_execute);
mux2to1_select mux2to1(mux2to1_result,src2,alu_result,mux2to1_select);
controller control(enable_execute,read,write,opcode,sub_opcode,mux5to1_select,mux2to1_select,imm_reg_select,clk,reset,ir);
	
endmodule
