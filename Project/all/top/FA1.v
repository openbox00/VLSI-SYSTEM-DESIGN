//+FHDR-----------------------------------------------------
// (C) Copyright Company
// All Right Reserved
//---------------------------------------------------------------
// FILE NAME:FA1.v
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
// PARAMETERS:FA1
// PARAMETER NAME RANGE
//DESCRIPTION DEFAULT VALUE
// PARAMETERS: None
//-FHDR------------------------------------------------------
`timescale 1ns/10ps
module FA1(// input
             xin, 
             yin, 
             zin, 
            
            // output 
             sout, 
             cout
            );
    
   input   xin;  
   input   yin;
   input   zin; 
   
   output  sout;  
   output  cout;
   
  // sum result
   assign sout = xin ^ yin ^ zin;
  
  // carry result 
   assign cout = xin & yin | zin & (xin | yin);

endmodule