`timescale 1ns/10ps
`define INPUTSIZE 8
`define OUTPUTSIZE 32
module Entropy(//input
             clk, 
             nrst,
             entropy_in,
             entropy_ena,
             lumenb_in,
             chromenb_uin,
             chromenb_vin,
             //output
				 JPEG_OUT,
				 total_finish,
				 final_enable,
				 busy,
				 frame_count,
				 jpg_en,
				 jpg_out,
				 entropy_cycle,
				 co_cycle
             );

input 		clk;
input 		nrst;
input [`INPUTSIZE-1:0]  entropy_in;
input 		entropy_ena;
input 		lumenb_in;
input 		chromenb_uin;
input 		chromenb_vin;

output [`OUTPUTSIZE-1:0] JPEG_OUT;
output 		total_finish;
output	   final_enable;	
output      busy;	
output [11:0] frame_count;

output  		jpg_en;
output [`OUTPUTSIZE-1:0] jpg_out;
output [14:0] entropy_cycle;
output [14:0] co_cycle;

wire [`OUTPUTSIZE-1:0] JPEG_OUT;
wire  		jpg_en;
wire [`OUTPUTSIZE-1:0] jpg_out;
wire [`OUTPUTSIZE-1:0] non_out;
wire [5:0]  non_length;
wire		   busy;
wire [3:0]  lrun,crun;
wire [3:0]  lsize,csize,dcsize;
wire [3:0]  llength,clength,ldcdf_length,cdcdf_length;
wire [8:0]  ldcdf_code;
wire [10:0] cdcdf_code;
wire [15:0] lcode,ccode;
wire [9:0]  unsg_dout;
wire [4:0]  length_bit;
wire        eob;
wire        dc;
wire        vlcdeno;
wire        vlcsign;
wire        idle; 
wire        lumenb_temp;
wire        chromenb_utemp;
wire        chromenb_vtemp;
wire		   frame_end;
wire [11:0] frame_count;

vlcctl vlcctl(
        //input
        .clk					(clk),
        .nrst          		(nrst), 
        .dqin          		(entropy_in),
        .den           		(entropy_ena),
        .lumenb_in     		(lumenb_in),
        .chromenb_uin  		(chromenb_uin),
        .chromenb_vin  		(chromenb_vin),
                   
        //output  
        .lumenb    	  		(lumenb_temp),
        .chromenb_u			(chromenb_utemp),
        .chromenb_v			(chromenb_vtemp), 
        .idle      			(idle),   
        .dc        			(dc), 
        .eob      		   (eob),
        .dcsize    			(dcsize),
        .vlcdeno   			(vlcdeno),
        .unsg_dout 			(unsg_dout),  
        .sign      			(vlcsign),
		  .frame_end 			(frame_end),
        .length_bit 			(length_bit), 
        .lrun      			(lrun),
        .lsize     			(lsize),
        .crun      			(crun),
        .csize     			(csize),
		  .frame_count			(frame_count),
		  .entropy_cycle		(entropy_cycle),
		  .co_cycle		  		(co_cycle)            );
    
packer packer(
        //input
        .clk       			(clk),
        .nrst      			(nrst),
        .idle      			(idle), 
        .den       			(vlcdeno),
        .dc        			(dc),
        .eob       			(eob),
        .lumenb    			(lumenb_temp),
        .chromenb_u 			(chromenb_utemp),
        .chromenb_v 			(chromenb_vtemp),                        
        .din       			(unsg_dout),
        .din_sign  			(vlcsign),
         
        //dc diff part
        .ldccode   			(ldcdf_code), 
        .ldclength 			(ldcdf_length),
        .cdccode   			(cdcdf_code),  
        .cdclength 			(cdcdf_length),
        
        //ac part                
        .lcode     			(lcode),
        .ccode     			(ccode),
        .llength   			(llength),        
        .clength   			(clength),   
        
        .length_bit			(length_bit),                                           
        
        //output  
        .jpg_en    			(jpg_en),   
        .jpg_out   			(jpg_out),
		  .up_reg	 			(non_out),
		  .non_length			(non_length),
        .busy     			(busy)				);
		  
finalpacker finalpacker(
		  	//input
		  .clk					(clk),
		  .nrst					(nrst),	
		  .jpg_en				(jpg_en),
		  .jpg_out				(jpg_out),
		  .non_out				(non_out),
		  .non_length			(non_length),
		  .frame_end			(frame_end),
		  
			//output
		  .JPEG_OUT				(JPEG_OUT),
		  .final_enable		(final_enable),
		  .total_finish		(total_finish)		);
				
dcdiff_htable dcdiff_htable(
         //input 
        .size      			(dcsize),
        .lumenb    			(lumenb_temp),
        .chromenb_u  		(chromenb_utemp),
        .chromenb_v  		(chromenb_vtemp), 
                   
        //output   
        .lcode    			(ldcdf_code),
        .llength   			(ldcdf_length),
        .ccode     			(cdcdf_code),
        .clength   			(cdcdf_length)		);         
        
        
lactable lactable(
         //input                 
        .run       			(lrun),
        .size      			(lsize),      
                           
        //output            
        .code      			(lcode),
        .length    			(llength)			);             
                                                                           
cactable cactable(            
         //input                 
        .run       			(crun),
        .size      			(csize),      
                           
        //outpu             
        .code      			(ccode),
        .length    			(clength)			);

endmodule
