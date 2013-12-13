//+FHDR------------------------------------------------------------------  
// (C) Copyright Company National Cheng Kung University (NCKU)             
//  All Right Reserved                                                     
//-----------------------------------------------------------------------  
//  FILE NAME: MEMWB.v                                                      
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
module MEMWB(//output
			 data_out,
			 IP_write_out;
			
		     //input
			 IP_write_in,
			 dataena,
			 data_in,
			 clk,
			 rst
			);

input [31:0] data_in;
input dataena;
input IP_write_in;
input clk;
input rst;

output reg  [31:0] 	data_out;
output reg	IP_write_out;


always @ (posedge clk or posedge rst)
begin
	if (rst) begin
		data_out = 32'd0;
		end
	if(dataena) begin
		data_out = data_out;
		IP_write_out = IP_write_out;
		end
		else begin
		data_out = data_in;
		IP_write_out = IP_write_in;
		end
	end


endmodule
