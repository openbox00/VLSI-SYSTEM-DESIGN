//+FHDR------------------------------------------------------------------  
// (C) Copyright Company National Cheng Kung University (NCKU)             
//  All Right Reserved                                                     
//-----------------------------------------------------------------------  
//  FILE NAME: IFID.v                                                      
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
module IFID(pc_out,
			inst_out,
			pc_in,
			inst_in,
			clk,
			rst
			);
			
input [31:0] pc_in;
input [31:0] inst_in;
input clk;
input rst;


output reg	[31:0] pc_out;
output reg	[31:0] inst_out;

always @ (posedge clk or posedge rst)
begin
	if(rst) begin
		pc_out <= 32'd0;
		inst_out <= 32'd0;
	end
	else begin
		pc_out <= pc_in;
		inst_out <= inst_in;
		end
	end

endmodule
