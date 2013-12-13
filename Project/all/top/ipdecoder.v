//+FHDR------------------------------------------------------------------  
// (C) Copyright Company National Cheng Kung University (NCKU)             
//  All Right Reserved                                                     
//-----------------------------------------------------------------------  
//  FILE NAME: ipdecoder.v                                                      
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

`define LWIP	6'b111111
`define SWIP	6'b111110

`define ip		5'b00000	//sel which ip

module ipdecoder(//output
				 datarw,
				 dataena,
				 IP_write,
						
				 //input
				 opcode, 
		//		 subopcode,
				 clk, 
				 rst
				 );

input clk;
input rst;
input [5:0] opcode;
//input [4:0] subopcode;

output reg datarw;	// datarw=1 write
output reg dataena; // dataena=1 read
output reg IP_write;

always @ (*)
begin
	case(opcode)
	`LWIP	:	begin
				datarw = 0;
				dataena = 1;
				IP_write = 1;
				end
	`SWIP	:	begin
				datarw = 1;
				dataena = 0;
				IP_write = 0;
				end
	default	:	begin
				datarw = 0;
				dataena = 0;
				IP_write = 0;
				end
	endcase
end

endmodule





