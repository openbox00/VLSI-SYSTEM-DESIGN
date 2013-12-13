//+FHDR------------------------------------------------------------------  
// (C) Copyright Company National Cheng Kung University (NCKU)             
//  All Right Reserved                                                     
//-----------------------------------------------------------------------  
//  FILE NAME: EXMEM.v                                                      
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
module EXMEM(//output
			datarw_out,
			dataena_out,
			address_out,
			IP_write_out,
			
			//input
			address_in,
			datarw_in,
			dataena_in,
			IP_write_in,
			clk,
			rst
			);

input [19:0] address_in;
input datarw_in;
input dataena_in;
input IP_write_in;
input clk;
input rst;

output reg  [19:0] 	address_out;
output reg 	datarw_out;
output reg	dataena_out;
output reg	IP_write_out;


always @ (posedge clk or posedge rst)
begin
	if (rst) begin
		datarw_out = 0;
		dataena_out = 0;
		address_out = 19'd0;
		IP_write_out = 0;
		end
		else begin
		datarw_out = datarw_in;
		dataena_out = dataena_in;
		address_out = address_in;
		IP_write_out = IP_write_in;
		end
	end


endmodule
