//+FHDR------------------------------------------------------------------  
// (C) Copyright Company National Cheng Kung University (NCKU)             
//  All Right Reserved                                                     
//-----------------------------------------------------------------------  
//  FILE NAME: FDCT.v                                                      
//  AUTHOR: 100                                              
//  CONTACT INFORMATION: n26991784@mail.ncku.edu.tw                    
//-----------------------------------------------------------------------  
//  RELEASE VERSION: v1.0                                                  
//  VERSION DESCRIPTION:    none                     
//-----------------------------------------------------------------------  
//  RELEASE DATE:  2011-01-14                                                        
//-----------------------------------------------------------------------  
//  PURPOSE:   FDCT table                                                           
//-----------------------------------------------------------------------  
//  PARAMETERS:    none                                                        
//         
//                               
//-FHDR------------------------------------------------------------------

// Coefficient for fast algorithm
  `define c1d8  7'b1110110
  `define c2d8  7'b1011011
  `define c3d8  7'b0110001
  
  `define c1d16 7'b1111110
  `define c3d16 7'b1101010
  `define c5d16 7'b1000111
  `define c7d16 7'b0011001
   
  `define width 4'b1100 //12
//------------------------------------------------------------------------------------------------//

`timescale 1ns / 10ps

module FDCT(data0_in, data1_in, data2_in, data3_in, data4_in, data5_in, data6_in, data7_in, out0, out1, out2, out3, out4, out5, out6, out7);
input  [`width-1:0] data0_in, data1_in, data2_in, data3_in, data4_in, data5_in, data6_in, data7_in;
output [`width-1:0] out0, out1, out2, out3, out4, out5, out6, out7;

wire  [`width-1:0] a0, a1, a2, a3, a4, a5, a6, a7;
wire  [`width-1:0] b0, b1, b2, b3, b4, b5, b6, b7;
wire  [`width-1:0] c0, c1, c2, c3, c4, c5, c6, c7;

assign a0 = ( data0_in ) + ( data7_in );
assign a1 = ( data1_in ) + ( data6_in );
assign a2 = ( data2_in ) + ( data5_in );
assign a3 = ( data3_in ) + ( data4_in );
assign a4 = ( data3_in ) - ( data4_in );
assign a5 = ( data2_in ) - ( data5_in );
assign a6 = ( data1_in ) - ( data6_in );
assign a7 = ( data0_in ) - ( data7_in );

assign b0 = ( a0 ) + ( a3 );
assign b1 = ( a1 ) + ( a2 );
assign b2 = ( a1 ) - ( a2 );
assign b3 = ( a0 ) - ( a3 );
assign b4 = ( a4 )         ;
wire  [`width+13:0] a6_c2d8 = {{7{a6[`width-1]}},a6}*`c2d8; 
wire  [`width+13:0] a5_c2d8 = {{7{a5[`width-1]}},a5}*`c2d8;
assign b5 = { a6_c2d8[`width+6:7] } - { a5_c2d8[`width+6:7] };
assign b6 = { a6_c2d8[`width+6:7] } + { a5_c2d8[`width+6:7] };
assign b7 = ( a7 )         ;

wire  [`width+13:0] b0_c2d8 = {{7{b0[`width-1]}},b0}*`c2d8;
wire  [`width+13:0] b1_c2d8 = {{7{b1[`width-1]}},b1}*`c2d8;
wire  [`width+13:0] b2_c3d8 = {{7{b2[`width-1]}},b2}*`c3d8;
wire  [`width+13:0] b2_c1d8 = {{7{b2[`width-1]}},b2}*`c1d8;
wire  [`width+13:0] b3_c1d8 = {{7{b3[`width-1]}},b3}*`c1d8;
wire  [`width+13:0] b3_c3d8 = {{7{b3[`width-1]}},b3}*`c3d8;

assign c0 = { b0_c2d8[`width+6:7] } + { b1_c2d8[`width+6:7] };
assign c1 = { b0_c2d8[`width+6:7] } - { b1_c2d8[`width+6:7] };
assign c2 = { b3_c1d8[`width+6:7] } + { b2_c3d8[`width+6:7] };
assign c3 = { b3_c3d8[`width+6:7] } - { b2_c1d8[`width+6:7] };
assign c4 = ( b4 ) + ( b5 );
assign c5 = ( b4 ) - ( b5 );
assign c6 = ( b7 ) - ( b6 );
assign c7 = ( b7 ) + ( b6 );

assign out0 = { c0[`width-1], c0[`width-1:1] } ;
assign out4 = { c1[`width-1], c1[`width-1:1] } ;
assign out2 = { c2[`width-1], c2[`width-1:1] } ;
assign out6 = { c3[`width-1], c3[`width-1:1] } ;

wire  [`width+13:0] c7_c1d16 = {{7{c7[`width-1]}},c7}*`c1d16;
wire  [`width+13:0] c6_c5d16 = {{7{c6[`width-1]}},c6}*`c5d16;
wire  [`width+13:0] c6_c3d16 = {{7{c6[`width-1]}},c6}*`c3d16;
wire  [`width+13:0] c7_c7d16 = {{7{c7[`width-1]}},c7}*`c7d16;
wire  [`width+13:0] c4_c7d16 = {{7{c4[`width-1]}},c4}*`c7d16;
wire  [`width+13:0] c5_c3d16 = {{7{c5[`width-1]}},c5}*`c3d16;
wire  [`width+13:0] c5_c5d16 = {{7{c5[`width-1]}},c5}*`c5d16;
wire  [`width+13:0] c4_c1d16 = {{7{c4[`width-1]}},c4}*`c1d16;

assign out1 ={ {c7_c1d16[`width+6]}, {c7_c1d16[`width+6:8]} } + { {c4_c7d16[`width+6]}, {c4_c7d16[`width+6:8]} } ;
assign out5 ={ {c6_c5d16[`width+6]}, {c6_c5d16[`width+6:8]} } + { {c5_c3d16[`width+6]}, {c5_c3d16[`width+6:8]} } ;
assign out3 ={ {c6_c3d16[`width+6]}, {c6_c3d16[`width+6:8]} } - { {c5_c5d16[`width+6]}, {c5_c5d16[`width+6:8]} } ;
assign out7 ={ {c7_c7d16[`width+6]}, {c7_c7d16[`width+6:8]} } - { {c4_c1d16[`width+6]}, {c4_c1d16[`width+6:8]} } ;

endmodule