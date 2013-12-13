//+FHDR-----------------------------------------------------
// (C) Copyright Company
// All Right Reserved
//---------------------------------------------------------------
// FILE NAME:quantable.v
// AUTHOR: VLSI DESIGN lab
// CONTACT INFORMATION:top
//---------------------------------------------------------------
// RELEASE VERSION: 2.2V19
// VERSION DESCRIPTION: IPQ Design Guidelines
//---------------------------------------------------------------
// RELEASE DATA: 11-07-2009
//---------------------------------------------------------------
// PURPOSE: Test complete file header
//---------------------------------------------------------------
// PARAMETERS:quantable
// PARAMETER NAME RANGE
//DESCRIPTION DEFAULT VALUE
// PARAMETERS: None
//-FHDR------------------------------------------------------
`timescale 1ns/10ps
module quantable(// input
               enable_quant, 
               enable_y,
               enable_cb, 
               enable_cr,
               clk,
               nrst,
               
              // output 
               enable_output,
               enable_zzscan,
               param_01, 
               param_02, 
               param_03, 
               param_04, 
	            param_05, 
	            param_06, 
	            param_07, 
	            param_08
	           );
	
	
	input 	       enable_quant;  
	input 	       enable_y;
	input 	       enable_cb;
	input         enable_cr;  
	input         clk;
	input         nrst;   

	output        enable_output;	 
	output        enable_zzscan;  
	output [6:0]  param_01;
	output [6:0]  param_02;
	output [6:0]  param_03;
	output [6:0]  param_04;
	output [6:0]  param_05;
	output [6:0]  param_06;
	output [6:0]  param_07;
	output [6:0]  param_08; 

	reg           enable_output;	  
	reg           enable_zzscan; 	                
	reg    [6:0]  param_01;
	reg    [6:0]  param_02;
	reg    [6:0]  param_03;
	reg    [6:0]  param_04;
	reg    [6:0]  param_05;
	reg    [6:0]  param_06;
	reg    [6:0]  param_07;
	reg    [6:0]  param_08; 
	
	reg [3:0]counter;
	
	wire          enable_chroma;
	
  // combine chroma signal	
   assign   enable_chroma = enable_cb | enable_cr;
   
  //counter
  always@(posedge clk)
    begin
      if(nrst==0)
        counter<=1;
      else if(enable_quant)
        counter<=counter+1;
      else
        counter<=1;
    end
 

  // generate quantization parameter 
   always @(counter or enable_quant or enable_y or enable_chroma) begin
      case(counter)
         4'd1: begin
            enable_output = 1;
            enable_zzscan = 0;
	       	 param_01 = 0; 
	         param_02 = 0; 
	     	   param_03 = 0; 
	         param_04 = 0; 
	         param_05 = 0; 
	         param_06 = 0; 
	         param_07 = 0; 
	         param_08 = 0; 
          end
         
	      4'd9: begin
               enable_output = 1;	
               enable_zzscan = 1;
            
            if(enable_y & enable_quant) begin
              param_01 = 7'd64;
	            param_02 = 7'd86; 
	            param_03 = 7'd73; 
	            param_04 = 7'd73; 
	            param_05 = 7'd57; 
	            param_06 = 7'd43; 
	            param_07 = 7'd21; 
	            param_08 = 7'd14; 
	          end
	          	
            else if(enable_chroma & enable_quant) begin 
	            param_01 = 7'd60;  
	            param_02 = 7'd57;
	            param_03 = 7'd43; 
	            param_04 = 7'd22;
	            param_05 = 7'd11;
	            param_06 = 7'd11;
	            param_07 = 7'd11;
	            param_08 = 7'd11;
             end  
            
            else begin
              param_01 = 7'd0; 
	            param_02 = 7'd0; 
	        	   param_03 = 7'd0; 
	            param_04 = 7'd0; 
	            param_05 = 7'd0; 
	            param_06 = 7'd0; 
	            param_07 = 7'd0; 
	            param_08 = 7'd0; 
	          end
         end
	        
         4'd10: begin
               enable_output = 1;	
               enable_zzscan = 1;
            
            if(enable_y & enable_quant) begin
              param_01 = 7'd93;  
	            param_02 = 7'd86;
	            param_03 = 7'd79; 
	            param_04 = 7'd60;
	            param_05 = 7'd47;
	            param_06 = 7'd29;
	            param_07 = 7'd16;
	            param_08 = 7'd11;
	          end
	          	 
            else if(enable_chroma & enable_quant) begin 
	          	 param_01 = 7'd57; 
	            param_02 = 7'd49;
	            param_03 = 7'd40; 
	            param_04 = 7'd16;
	            param_05 = 7'd11;
	            param_06 = 7'd11;
	            param_07 = 7'd11;
	            param_08 = 7'd11;
	          end 
            
            else begin
              param_01 = 7'd0; 
	            param_02 = 7'd0; 
	        	   param_03 = 7'd0; 
	            param_04 = 7'd0; 
	            param_05 = 7'd0; 
	            param_06 = 7'd0; 
	            param_07 = 7'd0; 
	            param_08 = 7'd0; 
	          end
         end

         4'd11: begin
               enable_output = 1;	
               enable_zzscan = 0;
             
            if(enable_y & enable_quant) begin
              param_01 = 7'd103;  
	            param_02 = 7'd73;
	            param_03 = 7'd64; 
	            param_04 = 7'd47;
	            param_05 = 7'd28;
	            param_06 = 7'd19;
	            param_07 = 7'd13;
	            param_08 = 7'd11;
	          end 
	          	          	   
            else if(enable_chroma & enable_quant) begin 
              param_01 = 7'd43; 
	            param_02 = 7'd40;
	            param_03 = 7'd18; 
	            param_04 = 7'd11;
	            param_05 = 7'd11;
	            param_06 = 7'd11;
	            param_07 = 7'd11;
	            param_08 = 7'd11;
	          end 
            
            else begin
              param_01 = 7'd0; 
	            param_02 = 7'd0; 
	        	   param_03 = 7'd0; 
	            param_04 = 7'd0; 
	            param_05 = 7'd0; 
	            param_06 = 7'd0; 
	            param_07 = 7'd0; 
	            param_08 = 7'd0; 
	          end
         end

	       4'd12: begin
               enable_output = 1;	
               enable_zzscan = 0;
            
            if(enable_y & enable_quant) begin
	            param_01 = 7'd64;  
	            param_02 = 7'd54;
	            param_03 = 7'd43; 
	            param_04 = 7'd36;
	            param_05 = 7'd18;
	            param_06 = 7'd16;
	            param_07 = 7'd12;
	            param_08 = 7'd11;
	          end 

         	   else if(enable_chroma & enable_quant) begin 
	            param_01 = 7'd22; 
	            param_02 = 7'd16;
	            param_03 = 7'd11; 
	            param_04 = 7'd11;
	            param_05 = 7'd11;
	            param_06 = 7'd11;
	            param_07 = 7'd11;
	            param_08 = 7'd11;
	          end 
            
            else begin
              param_01 = 7'd0; 
	            param_02 = 7'd0; 
	        	   param_03 = 7'd0; 
	            param_04 = 7'd0; 
	            param_05 = 7'd0; 
	            param_06 = 7'd0; 
	            param_07 = 7'd0; 
	            param_08 = 7'd0; 
	          end
         end
	        
	       4'd13: begin
               enable_output = 1;	
               enable_zzscan = 0;
  
            if(enable_y & enable_quant) begin
	            param_01 = 7'd43;  
	            param_02 = 7'd40;
	            param_03 = 7'd26; 
	            param_04 = 7'd20;
	            param_05 = 7'd15;
	            param_06 = 7'd13;
	            param_07 = 7'd10;
	            param_08 = 7'd9;
	          end 	
	                      
            else if(enable_chroma & enable_quant) begin 
	          	 param_01 = 7'd11; 
	            param_02 = 7'd11; 
	     	      param_03 = 7'd11; 
	            param_04 = 7'd11; 
	            param_05 = 7'd11; 
	            param_06 = 7'd11; 
	            param_07 = 7'd11; 
	            param_08 = 7'd11;
	          end 
            
            else begin
              param_01 = 7'd0; 
	            param_02 = 7'd0; 
	        	   param_03 = 7'd0; 
	            param_04 = 7'd0; 
	            param_05 = 7'd0; 
	            param_06 = 7'd0; 
	            param_07 = 7'd0; 
	            param_08 = 7'd0; 
	          end
         end        
	        
	       4'd14: begin
               enable_output = 1;	
               enable_zzscan = 0;
            
            if(enable_y & enable_quant) begin
 	            param_01 = 7'd26;  
	            param_02 = 7'd18;
	            param_03 = 7'd18; 
	            param_04 = 7'd12;
	            param_05 = 7'd10;
	            param_06 = 7'd10;
	            param_07 = 7'd9;
	            param_08 = 7'd10;
	          end 	
               
            else if(enable_chroma & enable_quant) begin
	          	 param_01 = 7'd11; 
	            param_02 = 7'd11; 
	     	      param_03 = 7'd11; 
	            param_04 = 7'd11; 
	            param_05 = 7'd11; 
	            param_06 = 7'd11; 
	            param_07 = 7'd11; 
	            param_08 = 7'd11; 
	          end 	        
	            
            else begin
              param_01 = 7'd0; 
	            param_02 = 7'd0; 
	        	   param_03 = 7'd0; 
	            param_04 = 7'd0; 
	            param_05 = 7'd0; 
	            param_06 = 7'd0; 
	            param_07 = 7'd0; 
	            param_08 = 7'd0; 
	          end
         end
                 
	       4'd15: begin
               enable_output = 1;	
               enable_zzscan = 0;
            
            if(enable_y & enable_quant) begin
	            param_01 = 7'd20;  
	            param_02 = 7'd17;
	            param_03 = 7'd15; 
	            param_04 = 7'd13;
	            param_05 = 7'd10;
	            param_06 = 7'd9;
	            param_07 = 7'd9;
	            param_08 = 7'd10;
	          end 	
	          	          	 
            else if(enable_chroma & enable_quant) begin 
	          	 param_01 = 7'd11; 
	            param_02 = 7'd11; 
	     	      param_03 = 7'd11; 
	            param_04 = 7'd11; 
	            param_05 = 7'd11; 
	            param_06 = 7'd11; 
	            param_07 = 7'd11; 
	            param_08 = 7'd11;
	          end 	
	            
            else begin
              param_01 = 7'd0; 
	            param_02 = 7'd0; 
	        	   param_03 = 7'd0; 
	            param_04 = 7'd0; 
	            param_05 = 7'd0; 
	            param_06 = 7'd0; 
	            param_07 = 7'd0; 
	            param_08 = 7'd0; 
	          end
          end
                 
         4'd0: begin
               enable_output = 1;	
               enable_zzscan = 0;
            
            if(enable_y & enable_quant) begin
              param_01 = 7'd17; 
	            param_02 = 7'd19;
	            param_03 = 7'd18; 
	            param_04 = 7'd17;
	            param_05 = 7'd13;
	            param_06 = 7'd11;
	            param_07 = 7'd10;
	            param_08 = 7'd11;
	          end 	
		                    	   
            else if(enable_chroma & enable_quant) begin 
              param_01 = 7'd11; 
	            param_02 = 7'd11; 
	     	      param_03 = 7'd11; 
	            param_04 = 7'd11; 
	            param_05 = 7'd11; 
	            param_06 = 7'd11; 
	            param_07 = 7'd11; 
	            param_08 = 7'd11;
	          end 
	             
            else begin
              param_01 = 7'd0; 
	            param_02 = 7'd0; 
	        	   param_03 = 7'd0; 
	            param_04 = 7'd0; 
	            param_05 = 7'd0; 
	            param_06 = 7'd0; 
	            param_07 = 7'd0; 
	            param_08 = 7'd0; 
	          end
          end
                
         default: begin
            enable_output = 0; 
            enable_zzscan = 0;
           param_01 = 7'd0; 
	         param_02 = 7'd0; 
	     	   param_03 = 7'd0; 
	         param_04 = 7'd0; 
	         param_05 = 7'd0; 
	         param_06 = 7'd0; 
	         param_07 = 7'd0; 
	         param_08 = 7'd0; 
	       end 
      endcase   	                	        
   end
endmodule

