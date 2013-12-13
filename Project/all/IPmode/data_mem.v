//+FHDR------------------------------------------------------------------  
// (C) Copyright Company National Cheng Kung University (NCKU)             
//  All Right Reserved                                                     
//-----------------------------------------------------------------------  
//  FILE NAME: data_mem.v                                                      
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

module DATA_MEM(clk, rst, data_rw, ena_data, addr, data_in, data_out);

parameter data_size = 32;
parameter addr_size = 32;
parameter mem_width = 8;
parameter mem_size = 256;//*1024;//64K*4

input clk;
input rst;
input data_rw;
input ena_data;
input [addr_size-1:0] addr;
input [31:0] data_in;

output [data_size-1:0] data_out;

reg [mem_width-1:0] data [mem_size-1:0];

integer i;

always@(posedge clk or posedge rst)
begin
	if(rst) begin
		for(i=0; i<mem_size; i=i+1) 
			data[i] <= 8'd0;
	end
	else if(data_rw) begin
		{data[addr], data[addr+1], data[addr+2], data[addr+3]} <= data_in;	 
	end
end

assign	 data_out = (ena_data)?{data[addr], data[addr+1], data[addr+2], data[addr+3]}:32'd0;


endmodule
