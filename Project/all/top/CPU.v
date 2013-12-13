//+FHDR------------------------------------------------------------------  
// (C) Copyright Company National Cheng Kung University (NCKU)             
//  All Right Reserved                                                     
//-----------------------------------------------------------------------  
//  FILE NAME: CPU.v                                                      
//  AUTHOR: 100                                              
//  CONTACT INFORMATION: n26991784@mail.ncku.edu.tw                    
//-----------------------------------------------------------------------  
//  RELEASE VERSION: v1.0                                                  
//  VERSION DESCRIPTION:                         
//-----------------------------------------------------------------------  
//  RELEASE DATE:                                                          
//-----------------------------------------------------------------------  
//  PURPOSE:    CPU top module                                                          
//-----------------------------------------------------------------------  
//  PARAMETERS:                                                            
//         
//                               
//-FHDR------------------------------------------------------------------

`timescale 1ns/10ps

module CPU(clk, rst);
input 	clk, rst;

wire	[31:0]	pc,inst_in,next_pc_out,inst_out;

wire	datarw,dataena;
wire	[5:0]	opcode;
//wire	[4:0]	subopcode;

wire	datarw_out,dataena_out,datarw_out2,dataena_out2;
wire	[19:0]	address,address_out,address_out2;

wire	[31:0]	data_out,out;

reg		[31:0]	next_pc;

wire	IP_write_out3,IP_write_out2,IP_write_out,IP_write;
wire	[31:0]	cpu_out;
wire	out_ready;

always @ (posedge clk or posedge rst)
begin
	if (rst) 
		next_pc = 32'd0;
	else
		next_pc = pc;		
end

		
//assign {opcode, addr_dst, addr1, addr2} = inst_out[30:10];
assign subopcode = inst_out[4:0];
assign pc = next_pc+32'd4;

assign {opcode} = inst_out[30:25];
assign {address} = inst_out[24:5];

controller	jepg(.clock(clk),
				 .reset(rst),
				 .enable(1'd1),
				 .write(IP_write_out3),
				 .ptr_out(17'd0),	
				 .cpu_in(out),
				 .cpu_out(cpu_out),
				 .out_ready(out_ready)
				 );

INST_MEM  inst_mem(.clk(clk), 
				   .pc({2'd0,next_pc[31:2]}), 
				   .inst_out(inst_in)
				   );

IFID	ifid(.pc_out(next_pc_out), 
			 .inst_out(inst_out), 
			 .pc_in(next_pc), 
			 
			 .inst_in(inst_in), 
			 .clk(clk), 
			 .rst(rst)
			 );

ipdecoder	decoder(.datarw(datarw),
					.dataena(dataena),
					.IP_write(IP_write),
						
					.opcode(opcode), 
			//		.subopcode(subopcode),
					.clk(clk), 
					.rst(rst)
					);						

IDEX	idex(.datarw_out(datarw_out),
			 .dataena_out(dataena_out),
			 .address_out(address_out),
			 .IP_write_out(IP_write_out),
			
			 .address_in(address),
			 .datarw_in(datarw),
			 .dataena_in(dataena),
			 .IP_write_in(IP_write),
			 .clk(clk),
			 .rst(rst)
			 );



EXMEM exmem(.datarw_out(datarw_out2),
			.dataena_out(dataena_out2),
			.address_out(address_out2),
			.IP_write_out(IP_write_out2),
			
			.address_in(address_out),
			.datarw_in(datarw_out),
			.dataena_in(dataena_out),
			.IP_write_in(IP_write_out),
			.clk(clk),
			.rst(rst)
			);
 

DATA_MEM data_mem(.clk(clk), 
				  .rst(rst), 
				  .data_rw(datarw_out2), 
				  .ena_data(dataena_out2), 
				  .addr({12'd0,address_out2}),
				  .data_in(32'd0), 
				  .data_out(data_out)
				  );			

				   
MEMWB memwb( .data_out(out),
			 .IP_write_out(IP_write_out3),
			
			 .data_in(data_out),
			 .IP_write_in(IP_write_out2),
			 .clk(clk),
			 .rst(rst)
			);



endmodule
