//+FHDR-----------------------------------------------------
// (C) Copyright Company
// All Right Reserved
//---------------------------------------------------------------
// FILE NAME:quant.v
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
// PARAMETERS:quant
// PARAMETER NAME RANGE
//DESCRIPTION DEFAULT VALUE
// PARAMETERS: None
//-FHDR------------------------------------------------------
`timescale 1ns/10ps
module quant(// input
              clk, 
              nrst, 
              enable_output,
              input_01, 
              input_02, 
              input_03, 
              input_04,
              input_05, 
              input_06, 
              input_07, 
              input_08,
           
             // output                 
              output_01, 
              output_02, 
              output_03, 
              output_04,
              output_05, 
              output_06, 
              output_07, 
              output_08
             );


   input         clk;  
   input         nrst;
   input         enable_output;
   input  [8:0]  input_01;
   input  [8:0]  input_02;
   input  [8:0]  input_03;
   input  [8:0]  input_04;
   input  [8:0]  input_05; 
   input  [8:0]  input_06;
   input  [8:0]  input_07;
   input  [8:0]  input_08;
                 
   output [7:0]  output_01;
   output [7:0]  output_02;
   output [7:0]  output_03;
   output [7:0]  output_04;
   output [7:0]  output_05;
   output [7:0]  output_06;
   output [7:0]  output_07;
   output [7:0]  output_08;
                  
   reg    [7:0]  output_01;
   reg    [7:0]  output_02;
   reg    [7:0]  output_03;
   reg    [7:0]  output_04;
   reg    [7:0]  output_05;
   reg    [7:0]  output_06;
   reg    [7:0]  output_07;
   reg    [7:0]  output_08;

 
  // output quantization result by enable 
    always @(posedge clk or negedge nrst) begin
        if(~nrst) begin
          output_01 <= 0; 
          output_02 <= 0; 
          output_03 <= 0;
          output_04 <= 0;
          output_05 <= 0;
          output_06 <= 0;
          output_07 <= 0;
          output_08 <= 0;
        end
          
       // round off 
        else begin 
            if(enable_output) begin
                output_01 <= (input_01[0] == 0)? input_01[8:1]: input_01[8:1] + 1;
                output_02 <= (input_02[0] == 0)? input_02[8:1]: input_02[8:1] + 1;
                output_03 <= (input_03[0] == 0)? input_03[8:1]: input_03[8:1] + 1;
                output_04 <= (input_04[0] == 0)? input_04[8:1]: input_04[8:1] + 1;
                output_05 <= (input_05[0] == 0)? input_05[8:1]: input_05[8:1] + 1;
                output_06 <= (input_06[0] == 0)? input_06[8:1]: input_06[8:1] + 1;
                output_07 <= (input_07[0] == 0)? input_07[8:1]: input_07[8:1] + 1;
                output_08 <= (input_08[0] == 0)? input_08[8:1]: input_08[8:1] + 1;
            end
                
            else begin
                output_01 <= 0; 
                output_02 <= 0; 
                output_03 <= 0;
                output_04 <= 0;
                output_05 <= 0;
                output_06 <= 0;
                output_07 <= 0;
                output_08 <= 0;
            end
        end
    end   
endmodule


