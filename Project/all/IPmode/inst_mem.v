//+FHDR------------------------------------------------------------------  
// (C) Copyright Company National Cheng Kung University (NCKU)             
//  All Right Reserved                                                     
//-----------------------------------------------------------------------  
//  FILE NAME: inst_mem.v                                                      
//  AUTHOR: 100                                              
//  CONTACT INFORMATION: n26991784@mail.ncku.edu.tw                    
//-----------------------------------------------------------------------  
//  RELEASE VERSION: v1.0                                                  
//  VERSION DESCRIPTION:                         
//-----------------------------------------------------------------------  
//  RELEASE DATE:                                                          
//-----------------------------------------------------------------------  
//  PURPOSE:                                                              
//-----------------------------------------------------------------------  
//  PARAMETERS:                                                            
//         
//                               
//-FHDR------------------------------------------------------------------

`timescale 1ns/10ps

module INST_MEM (clk, pc, inst_out);
parameter IM_SIZE = 100;//*1024;//*1024;//2^29
input clk;
input [31:0] pc;
output [31:0] inst_out;

reg [31:0] inst [IM_SIZE-1:0];


assign inst_out = inst[pc];

endmodule
