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
			IP_read_out,
			
			
			//input
			IP_read_in,
			IP_write_in,
			address_in,
			datarw_in,
			dataena_in,
			count,
			clk,
			rst
			);

input [19:0] address_in;
input datarw_in;
input dataena_in;
input IP_write_in;
input count;
input IP_read_in;
input clk;
input rst;

output reg  [19:0] 	address_out;
output reg 	datarw_out;
output reg	dataena_out;
output reg	IP_write_out;
output reg  IP_read_out;

always @ (posedge clk or posedge rst)
begin
	if (rst) begin
		datarw_out = 0;
		address_out = 19'd0;
		IP_write_out = 0;
		IP_read_out = 0;
		end
		else begin
		datarw_out = datarw_in;
		address_out = address_in;
		IP_write_out = IP_write_in;
		IP_read_out = IP_read_in;
		end
	end

always @ (posedge clk or posedge rst)
begin
	if (rst) 
		dataena_out = 0;
	else if (dataena_out==1 && count)
		dataena_out = 0;
	else if (count==0 && dataena_out==1)
		dataena_out = dataena_out;
	else
		dataena_out = dataena_in;
end

endmodule
