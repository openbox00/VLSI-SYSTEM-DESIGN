//+FHDR-----------------------------------------------------
// (C) Copyright Company
// All Right Reserved
//---------------------------------------------------------------
// FILE NAME:Quantize.v
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
// PARAMETERS:Quantize
// PARAMETER NAME RANGE
//DESCRIPTION DEFAULT VALUE
// PARAMETERS: None
//-FHDR------------------------------------------------------
`timescale 1ns/10ps
module Quantize(// input clock and reset
                     clk, 
                     nrst, 
                    
                    // input mode 
                     enable_y,
                     enable_cb,
                     enable_cr, 
                    
                    // input quantization enable
                     enable_quant, 
                    
                    // input dct counter (0~15)
                    // counter, 
                    
                    // input dct result (12-bit)
                     input_01, 
                     input_02, 
                     input_03, 
                     input_04,
                     input_05, 
                     input_06, 
                     input_07, 
                     input_08,                    
                    
                    // output zzscan enable
                     enable_zzscan,  
        
                    // output quantization value (8-bit)
                     output_01, 
                     output_02, 
                     output_03, 
                     output_04,
                     output_05, 
                     output_06, 
                     output_07, 
                     output_08,
							quant_cycle );
                    
   input         clk; 
   input         nrst; 
   input         enable_y;
   input         enable_cb;
   input         enable_cr; 
   input         enable_quant;   
   //input  [3:0]  counter; 
   input [11:0]  input_01; 
   input [11:0]  input_02; 
   input [11:0]  input_03; 
   input [11:0]  input_04;
   input [11:0]  input_05; 
   input [11:0]  input_06; 
   input [11:0]  input_07; 
   input [11:0]  input_08;     
 
               
   output        enable_zzscan;  
   output [7:0]  output_01; 
   output [7:0]  output_02; 
   output [7:0]  output_03; 
   output [7:0]  output_04; 
   output [7:0]  output_05; 
   output [7:0]  output_06; 
   output [7:0]  output_07; 
   output [7:0]  output_08; 
	output [14:0] quant_cycle;

	reg	 [14:0] quant_cycle;
	
  // quantization enable to output 
   wire          enable_output;


  // QT parameter to MUL                 
   wire   [6:0]  param_01, param_02, param_03, param_04, param_05, param_06, param_07, param_08;     


  // multiplier 20-bit result [17:9]
   wire   [8:0]  result_01, result_02, result_03, result_04, result_05, result_06, result_07, result_08;     

   always@(posedge clk or negedge nrst) begin //state reg
       if(~nrst) quant_cycle <= 0;
       else if(enable_quant) quant_cycle <= quant_cycle + 1;
   end

	
  smul  u_Mulp1(// input
                .ain(input_01), 
                .bin(param_01), 
               
               // output 
                .pout(result_01) 
               ); 
        
                
  smul  u_Mulp2(// input
                .ain(input_02), 
                .bin(param_02), 
               
               // output 
                .pout(result_02) 
               ); 
   
   
  smul  u_Mulp3(// input
                .ain(input_03), 
                .bin(param_03), 
               
               // output 
                .pout(result_03) 
               ); 
   
   
  smul  u_Mulp4(// input
                .ain(input_04), 
                .bin(param_04), 
               
               // output 
                .pout(result_04) 
               ); 
   
   
  smul  u_Mulp5(// input
                .ain(input_05), 
                .bin(param_05), 
               
               // output 
                .pout(result_05) 
               ); 
   
   
  smul  u_Mulp6(// input
                .ain(input_06), 
                .bin(param_06), 
               
               // output 
                .pout(result_06) 
               ); 
  
   
  smul  u_Mulp7(// input
                .ain(input_07), 
                .bin(param_07), 
               
               // output 
                 .pout(result_07) 
               ); 
  
   
  smul  u_Mulp8(// input
                .ain(input_08), 
                .bin(param_08), 
              
               // output 
                .pout(result_08) 
               );   
  
  
  quantable	 u_quantable(// input
	              .enable_quant(enable_quant), 
                 .enable_y(enable_y),
                 .enable_cb(enable_cb),
                 .enable_cr(enable_cr),
                 .clk(clk),
                 .nrst(nrst), 
	              
	             // output
	              .enable_output(enable_output),
	              .enable_zzscan(enable_zzscan),
                 .param_01(param_01), 
                 .param_02(param_02), 
                 .param_03(param_03), 
                 .param_04(param_04), 
                 .param_05(param_05), 
                 .param_06(param_06), 
                 .param_07(param_07), 
                 .param_08(param_08) 
                );  
                      
              
  quant	 u_quant(// input
	              .clk(clk), 
	              .nrst(nrst), 
	              .enable_output(enable_output),
	              .input_01(result_01), 
	              .input_02(result_02), 
                 .input_03(result_03), 
                 .input_04(result_04),
                 .input_05(result_05), 
                 .input_06(result_06), 
                 .input_07(result_07), 
                 .input_08(result_08),
                
                // output
                 .output_01(output_01), 
                 .output_02(output_02), 
                 .output_03(output_03), 
                 .output_04(output_04),
                 .output_05(output_05), 
                 .output_06(output_06), 
                 .output_07(output_07), 
                 .output_08(output_08) 
                );
 
endmodule


