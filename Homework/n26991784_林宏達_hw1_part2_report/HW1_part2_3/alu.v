`define ADD     5'b00000
`define SUB     5'b00001
`define AND     5'b00010
`define OR      5'b00100
`define XOR     5'b00011
`define SRLI    5'b01001
`define SLLI    5'b01000
`define ROTRI   5'b01011

`timescale 1ns/10ps
module alu(alu_result,alu_overflow,read_data1,src2,opcode,sub_opcode,enable_execute);
  
  output  reg  [31:0] alu_result;
  output  reg         alu_overflow;
  
  input        [31:0] read_data1,src2;
  input        [5:0]  opcode;
  input        [4:0]  sub_opcode;
  input               enable_execute;
  
  reg          [63:0] rotate;
  reg                 a,b;
  
  always@(posedge enable_execute)begin
	if(enable_execute)begin
		case(opcode)
			6'b100000 : case(sub_opcode)
                    `ADD   : begin
                              {a,alu_result[30:0]}=read_data1[30:0]+src2[30:0];
                              {b,alu_result[31]}=read_data1[31]+src2[31]+a;
                              alu_overflow=a^b;
                            end
                    `SUB   : begin
                              {a,alu_result[30:0]}=read_data1[30:0]-src2[30:0];
                              {b,alu_result[31]}=read_data1[31]-src2[31]-a;
                              alu_overflow=a^b;
                            end 
                    `AND   : begin
                              alu_result    = read_data1&src2;
                              alu_overflow  = 1'b0;
                            end
                    `OR    : begin
                              alu_result    = read_data1|src2;
                              alu_overflow  = 1'b0;
                            end
                    `XOR   : begin
                              alu_result    = read_data1^src2;
                              alu_overflow  = 1'b0;
                            end 
                    `SRLI  : begin
                              alu_result    = read_data1>>src2;
                              alu_overflow  = 1'b0;
                            end
                    `SLLI  : begin
                              alu_result    = read_data1<<src2;
                              alu_overflow  = 1'b0;
                            end
                    `ROTRI : begin
                             rotate        = {read_data1,read_data1}>>src2;
				             alu_result    = rotate[31:0];
                             alu_overflow  = 1'b0;
                             end 
					
                  default : begin
                              alu_overflow=1'b0;
                              alu_result=32'b0;
                            end
                 endcase   
    6'b101000 : begin
                  {a,alu_result[30:0]}=read_data1[30:0]+src2[30:0];
                  {b,alu_result[31]}=read_data1[31]+src2[31]+a;
                  alu_overflow=a^b;    
                end
    6'b101100 : begin
                  alu_overflow=1'b0;
                  alu_result=read_data1|src2;
                end                
    6'b101011 : begin
                  alu_overflow=1'b0;
                  alu_result=read_data1^src2;
                end 

    default   : begin
                  alu_overflow=1'b0;
                  alu_result=32'b0;
                end  
   endcase                                             
  end 
  else begin
    alu_result=32'b0;
    alu_overflow=1'b0;
  end
end
endmodule
