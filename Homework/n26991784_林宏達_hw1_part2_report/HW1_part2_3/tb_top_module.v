`timescale 1ns/10ps
`define cycle 100
module tb_top_module();
  
  parameter datasize = 32;
  parameter addrsize = 5;
  
   
  wire alu_overflow;  
  reg [19:0]  immediate;
  reg [addrsize-1:0] read_address1;
  reg [addrsize-1:0] read_address2;
  reg [addrsize-1:0] write_address;
  reg reset_reg,read,write,enable_execute,mux2to1_select,imm_reg_select;
  reg [2:0] mux5to1_select;
  reg        [5:0]  opcode;
  reg        [4:0]  sub_opcode; 
  reg clk;
  wire [31:0] R1= tb_top_module.top.register.rw_reg[1],R2=tb_top_module.top.register.rw_reg[2],R3= tb_top_module.top.register.rw_reg[3];
  wire [31:0] write_data=tb_top_module.top.mux2to1.write_data;
  wire [31:0] alu1=	tb_top_module.top.alu_m1.read_data1,alu2=tb_top_module.top.alu_m1.src2;
  wire [31:0] alu_result=tb_top_module.top.alu_m1.alu_result;
  
top_module top(alu_overflow,read_address1,read_address2,
              write_address,opcode,sub_opcode,enable_execute,
              clk,reset_reg,read,write,mux5to1_select,
              mux2to1_select,imm_reg_select,immediate);
                  
initial begin
  $monitor($time,"alu_overflow= %d, read_address1 = %d, read_address2 = %d, write_address = %d,	alu_result = %d, immediate = %d, R1 = %d, R2 = %d, R3 = %d, write_data = %d",
                  alu_overflow,read_address1,read_address2,write_address,alu_result,immediate,R1,R2,R3,write_data);
 end

 initial begin
				reset_reg=1;enable_execute=0;write=0;read=0;mux5to1_select=3'b000;imm_reg_select=0;mux2to1_select=0;
				read_address1=5'b00000;read_address2=5'b00000;write_address=5'b00000;	
				
#`cycle     	reset_reg=0;enable_execute=0;write=1;read=0;mux5to1_select=3'b100;imm_reg_select=1;mux2to1_select=0;
				write_address=5'b00001;immediate=20'h00001;

#`cycle     	enable_execute=0;write=1;read=0;mux5to1_select=3'b100;imm_reg_select=1;mux2to1_select=0;
				write_address=5'b00010;immediate=20'h00010;
				
#`cycle     	enable_execute=0;write=0;read=1;mux5to1_select=3'b000;imm_reg_select=0;mux2to1_select=0;
				read_address1=5'b00001;read_address2=5'b00010;write_address=5'b00011;opcode=6'b100000;sub_opcode=5'b00000;
				
#`cycle     	enable_execute=1;write=0;read=0;mux5to1_select=3'b000;imm_reg_select=0;mux2to1_select=0;
				read_address1=5'b00001;read_address2=5'b00010;write_address=5'b00011;opcode=6'b100000;sub_opcode=5'b00000;
				
#`cycle     	enable_execute=0;write=1;read=0;mux5to1_select=3'b000;imm_reg_select=0;mux2to1_select=1;
				read_address1=5'b00001;read_address2=5'b00010;write_address=5'b00011;opcode=6'b100000;sub_opcode=5'b00000;

 
 end
 
initial begin
	clk = 0;
	forever #(`cycle/2) clk = ~clk;
end
 
initial begin
   #1000 $finish;
end

initial begin
$dumpfile("top.vcd");
$dumpvars;
end
endmodule
