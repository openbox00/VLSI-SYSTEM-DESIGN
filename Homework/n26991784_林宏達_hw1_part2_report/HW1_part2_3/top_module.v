`timescale 1ns/10ps

module top_module(alu_overflow,read_address1,read_address2,
                  write_address,opcode,sub_opcode,enable_execute,
                  clk,reset_reg,read,write,mux5to1_select,
                  mux2to1_select,imm_reg_select,immediate);
  
  parameter datasize = 32;
  parameter addrsize = 5;
  
  output alu_overflow;  
  input [19:0]  immediate;
  input [addrsize-1:0] read_address1;
  input [addrsize-1:0] read_address2;
  input [addrsize-1:0] write_address;
  input reset_reg,read,write,enable_execute,mux2to1_select,imm_reg_select;
  input [2:0] mux5to1_select;
  input        [5:0]  opcode;
  input        [4:0]  sub_opcode; 
  input clk;
      
  
  wire [datasize-1:0] read_data1;
  wire [datasize-1:0] read_data2;
  wire [datasize-1:0] write_data;
  wire [datasize-1:0] sign_extend;
  wire [datasize-1:0] src2;
  wire [datasize-1:0] alu_result;
  wire [19:0] mux5to1_result;
  

regfile register(read_data1,read_data2,read_address1,read_address2,write_address,write_data,clk,reset,read,write);
imm_reg_select imm_reg(src2,read_data2,sign_extend,imm_reg_select);
sign_extend sign(sign_extend,mux5to1_result);
mux5to1_select mux5to1(mux5to1_result,immediate,mux5to1_select);
alu alu_m1(alu_result,alu_overflow,read_data1,src2,opcode,sub_opcode,enable_execute);
mux2to1_select mux2to1(write_data,src2,alu_result,mux2to1_select);
 
endmodule
