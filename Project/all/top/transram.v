//+FHDR------------------------------------------------------------------  
// (C) Copyright Company National Cheng Kung University (NCKU)             
//  All Right Reserved                                                     
//-----------------------------------------------------------------------  
//  FILE NAME: transram.v                                                      
//  AUTHOR: 100                                              
//  CONTACT INFORMATION: n26991784@mail.ncku.edu.tw                    
//-----------------------------------------------------------------------  
//  RELEASE VERSION: v1.0                                                  
//  VERSION DESCRIPTION:   none                      
//-----------------------------------------------------------------------  
//  RELEASE DATE:  2011-01-14                                                        
//-----------------------------------------------------------------------  
//  PURPOSE:    transform of DCT                                                         
//-----------------------------------------------------------------------  
//  PARAMETERS:  none                                                          
//         
//                               
//-FHDR------------------------------------------------------------------

`timescale 1ns/10ps   
module transram(//intput
				    clk, 
					rst, 
					rw, 
					addr, 
					in0, 
					in1, 
					in2, 
					in3, 
					in4, 
					in5, 
					in6, 
					in7,
				
				    //output
				    out0, 
					out1, 
					out2, 
					out3, 
					out4, 
					out5, 
					out6, 
					out7
					);
  
  input clk,rst,rw;//rw=1 write ; rw=0 read
  input [2:0] addr;
  input [11:0]  in0,in1,in2,in3,in4,in5,in6,in7;
  output [11:0] out0,out1,out2,out3,out4,out5,out6,out7;
  
  integer i;
  reg [11:0] mem[63:0];
  
  reg [11:0] out0,out1,out2,out3,out4,out5,out6,out7;
  
  wire [5:0] addr_w0 = {addr,3'b000};//addr_w0=addr*8
  wire [5:0] addr_w1 = {addr,3'b001};//addr_w1=addr*8+1
  wire [5:0] addr_w2 = {addr,3'b010};//addr_w2=addr*8+2
  wire [5:0] addr_w3 = {addr,3'b011};//addr_w3=addr*8+3
  wire [5:0] addr_w4 = {addr,3'b100};//addr_w4=addr*8+4
  wire [5:0] addr_w5 = {addr,3'b101};//addr_w5=addr*8+5
  wire [5:0] addr_w6 = {addr,3'b110};//addr_w6=addr*8+6
  wire [5:0] addr_w7 = {addr,3'b111};//addr_w7=addr*8+7
  wire [5:0] addr_r0 = {3'b000,addr};//addr_r0=addr
  wire [5:0] addr_r1 = {3'b001,addr};//addr_r1=addr+8
  wire [5:0] addr_r2 = {3'b010,addr};//addr_r2=addr+16
  wire [5:0] addr_r3 = {3'b011,addr};//addr_r3=addr+24
  wire [5:0] addr_r4 = {3'b100,addr};//addr_r4=addr+32
  wire [5:0] addr_r5 = {3'b101,addr};//addr_r5=addr+40
  wire [5:0] addr_r6 = {3'b110,addr};//addr_r6=addr+48
  wire [5:0] addr_r7 = {3'b111,addr};//addr_r7=addr+56
  				
  //wite and reset
  always@(posedge clk or posedge rst) begin
    if(rst) for(i=0;i<=63;i=i+1) mem[i]<=12'b0;
    else if(rw) begin
      mem[addr_w0]<=in0;
      mem[addr_w1]<=in1;
      mem[addr_w2]<=in2;
      mem[addr_w3]<=in3;
      mem[addr_w4]<=in4;
      mem[addr_w5]<=in5;
      mem[addr_w6]<=in6;
      mem[addr_w7]<=in7;       
    end
  end
  
  //read
  always@(addr_r0 or addr_r1 or addr_r2 or addr_r3 or addr_r4 or addr_r5 or addr_r6 or addr_r7) begin
    out0=mem[addr_r0];
    out1=mem[addr_r1];
    out2=mem[addr_r2];
    out3=mem[addr_r3];
    out4=mem[addr_r4];
    out5=mem[addr_r5];
    out6=mem[addr_r6];
    out7=mem[addr_r7];
  end
				
				
endmodule