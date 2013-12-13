//+FHDR-----------------------------------------------------
// (C) Copyright Company
// All Right Reserved
//---------------------------------------------------------------
// FILE NAME:smul.v
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
// PARAMETERS:smul
// PARAMETER NAME RANGE
//DESCRIPTION DEFAULT VALUE
// PARAMETERS: None
//-FHDR------------------------------------------------------
`timescale 1ns/10ps
module smul(// input
             ain, bin, 
             
             // output 
              pout
             );
     
    input  [11:0]  ain;   //signed input 12-bit
    input  [6:0]   bin;   //unsigned input 7-bit
    
    output [8:0]   pout;   //signed output 9-bit 
                           //last bit for rounding 

    wire fa1b_s = ain[1] & bin[0];
    wire fa1a_s = ain[2] & bin[0];
    wire fa19_s = ain[3] & bin[0];
    wire fa18_s = ain[4] & bin[0];
    wire fa17_s = ain[5] & bin[0];
    wire fa16_s = ain[6] & bin[0];
    wire fa15_s = ain[7] & bin[0];
    wire fa14_s = ain[8] & bin[0];
    wire fa13_s = ain[9] & bin[0];    
    wire fa12_s = ain[10] & bin[0];  
    wire fa11_s = ain[11] & bin[0];         
   
 
  //==========================================================================
                    
    wire fa2b_s, fa2a_s, fa29_s, fa28_s, fa27_s, fa26_s, fa25_s, fa24_s, fa23_s, fa22_s;  
    wire fa2b_c, fa2a_c, fa29_c, fa28_c, fa27_c, fa26_c, fa25_c, fa24_c, fa23_c, fa22_c;
    
    wire zin2c = ain[0] & bin[1];
    wire zin2b = ain[1] & bin[1];
    wire zin2a = ain[2] & bin[1];
    wire zin29 = ain[3] & bin[1];
    wire zin28 = ain[4] & bin[1];
    wire zin27 = ain[5] & bin[1];
    wire zin26 = ain[6] & bin[1];
    wire zin25 = ain[7] & bin[1];
    wire zin24 = ain[8] & bin[1];
    wire zin23 = ain[9] & bin[1];    
    wire zin22 = ain[10] & bin[1]; 

    wire fa2c_c = fa1b_s & zin2c; 
 
   HA1 fa2b(.xin(fa1a_s), .yin(zin2b), .sout(fa2b_s), .cout(fa2b_c) );  
   HA1 fa2a(.xin(fa19_s), .yin(zin2a), .sout(fa2a_s), .cout(fa2a_c) );  
   HA1 fa29(.xin(fa18_s), .yin(zin29), .sout(fa29_s), .cout(fa29_c) );  
   HA1 fa28(.xin(fa17_s), .yin(zin28), .sout(fa28_s), .cout(fa28_c) );  
   HA1 fa27(.xin(fa16_s), .yin(zin27), .sout(fa27_s), .cout(fa27_c) );  
   HA1 fa26(.xin(fa15_s), .yin(zin26), .sout(fa26_s), .cout(fa26_c) );  
   HA1 fa25(.xin(fa14_s), .yin(zin25), .sout(fa25_s), .cout(fa25_c) ); 
   HA1 fa24(.xin(fa13_s), .yin(zin24), .sout(fa24_s), .cout(fa24_c) );   
   HA1 fa23(.xin(fa12_s), .yin(zin23), .sout(fa23_s), .cout(fa23_c) );  
   HA2 fa22(.xin(fa11_s), .yin(zin22), .sout(fa22_s), .cout(fa22_c) );   

    wire fa21_s = ain[11] & bin[1];
      
 //==========================================================================
 
    wire fa3b_s, fa3a_s, fa39_s, fa38_s, fa37_s, fa36_s, fa35_s, fa34_s, fa33_s, fa32_s;  
    wire fa3c_c, fa3b_c, fa3a_c, fa39_c, fa38_c, fa37_c, fa36_c, fa35_c, fa34_c, fa33_c, fa32_c; 
    
    wire zin3c = ain[0] & bin[2];
    wire zin3b = ain[1] & bin[2];
    wire zin3a = ain[2] & bin[2];
    wire zin39 = ain[3] & bin[2];
    wire zin38 = ain[4] & bin[2];
    wire zin37 = ain[5] & bin[2];
    wire zin36 = ain[6] & bin[2];
    wire zin35 = ain[7] & bin[2];
    wire zin34 = ain[8] & bin[2];
    wire zin33 = ain[9] & bin[2];    
    wire zin32 = ain[10] & bin[2];

                           
   FA3 fa3c(.xin(fa2b_s), .yin(fa2c_c), .zin(zin3c), .cout(fa3c_c) );  
   FA1 fa3b(.xin(fa2a_s), .yin(fa2b_c), .zin(zin3b), .sout(fa3b_s), .cout(fa3b_c) );  
   FA1 fa3a(.xin(fa29_s), .yin(fa2a_c), .zin(zin3a), .sout(fa3a_s), .cout(fa3a_c) );  
   FA1 fa39(.xin(fa28_s), .yin(fa29_c), .zin(zin39), .sout(fa39_s), .cout(fa39_c) );  
   FA1 fa38(.xin(fa27_s), .yin(fa28_c), .zin(zin38), .sout(fa38_s), .cout(fa38_c) );  
   FA1 fa37(.xin(fa26_s), .yin(fa27_c), .zin(zin37), .sout(fa37_s), .cout(fa37_c) );  
   FA1 fa36(.xin(fa25_s), .yin(fa26_c), .zin(zin36), .sout(fa36_s), .cout(fa36_c) );  
   FA1 fa35(.xin(fa24_s), .yin(fa25_c), .zin(zin35), .sout(fa35_s), .cout(fa35_c) ); 
   FA1 fa34(.xin(fa23_s), .yin(fa24_c), .zin(zin34), .sout(fa34_s), .cout(fa34_c) );   
   FA1 fa33(.xin(fa22_s), .yin(fa23_c), .zin(zin33), .sout(fa33_s), .cout(fa33_c) );  
   FA2 fa32(.xin(fa21_s), .yin(fa22_c), .zin(zin32), .sout(fa32_s), .cout(fa32_c) );  

    wire fa31_s = ain[11] & bin[2];                              
 
 //==========================================================================
 
    wire fa4b_s, fa4a_s, fa49_s, fa48_s, fa47_s, fa46_s, fa45_s, fa44_s, fa43_s, fa42_s;  
    wire fa4c_c, fa4b_c, fa4a_c, fa49_c, fa48_c, fa47_c, fa46_c, fa45_c, fa44_c, fa43_c, fa42_c; 

    wire zin4c = ain[0] & bin[3];
    wire zin4b = ain[1] & bin[3];
    wire zin4a = ain[2] & bin[3];
    wire zin49 = ain[3] & bin[3];
    wire zin48 = ain[4] & bin[3];
    wire zin47 = ain[5] & bin[3];
    wire zin46 = ain[6] & bin[3];
    wire zin45 = ain[7] & bin[3];
    wire zin44 = ain[8] & bin[3];
    wire zin43 = ain[9] & bin[3];    
    wire zin42 = ain[10] & bin[3]; 

                           
   FA3 fa4c(.xin(fa3b_s), .yin(fa3c_c), .zin(zin4c), .cout(fa4c_c) );  
   FA1 fa4b(.xin(fa3a_s), .yin(fa3b_c), .zin(zin4b), .sout(fa4b_s), .cout(fa4b_c) );  
   FA1 fa4a(.xin(fa39_s), .yin(fa3a_c), .zin(zin4a), .sout(fa4a_s), .cout(fa4a_c) );  
   FA1 fa49(.xin(fa38_s), .yin(fa39_c), .zin(zin49), .sout(fa49_s), .cout(fa49_c) );  
   FA1 fa48(.xin(fa37_s), .yin(fa38_c), .zin(zin48), .sout(fa48_s), .cout(fa48_c) );  
   FA1 fa47(.xin(fa36_s), .yin(fa37_c), .zin(zin47), .sout(fa47_s), .cout(fa47_c) );  
   FA1 fa46(.xin(fa35_s), .yin(fa36_c), .zin(zin46), .sout(fa46_s), .cout(fa46_c) );  
   FA1 fa45(.xin(fa34_s), .yin(fa35_c), .zin(zin45), .sout(fa45_s), .cout(fa45_c) ); 
   FA1 fa44(.xin(fa33_s), .yin(fa34_c), .zin(zin44), .sout(fa44_s), .cout(fa44_c) );   
   FA1 fa43(.xin(fa32_s), .yin(fa33_c), .zin(zin43), .sout(fa43_s), .cout(fa43_c) );  
   FA2 fa42(.xin(fa31_s), .yin(fa32_c), .zin(zin42), .sout(fa42_s), .cout(fa42_c) );  
 
    wire fa41_s = ain[11] & bin[3];  
                             
 //==========================================================================
 
    wire fa5b_s, fa5a_s, fa59_s, fa58_s, fa57_s, fa56_s, fa55_s, fa54_s, fa53_s, fa52_s; 
    wire fa5c_c, fa5b_c, fa5a_c, fa59_c, fa58_c, fa57_c, fa56_c, fa55_c, fa54_c, fa53_c, fa52_c; 
 
    wire zin5c = ain[0] & bin[4];
    wire zin5b = ain[1] & bin[4];
    wire zin5a = ain[2] & bin[4];
    wire zin59 = ain[3] & bin[4];
    wire zin58 = ain[4] & bin[4];
    wire zin57 = ain[5] & bin[4];
    wire zin56 = ain[6] & bin[4];
    wire zin55 = ain[7] & bin[4];
    wire zin54 = ain[8] & bin[4];
    wire zin53 = ain[9] & bin[4];    
    wire zin52 = ain[10] & bin[4]; 

                          
   FA3 fa5c(.xin(fa4b_s), .yin(fa4c_c), .zin(zin5c), .cout(fa5c_c) );  
   FA1 fa5b(.xin(fa4a_s), .yin(fa4b_c), .zin(zin5b), .sout(fa5b_s), .cout(fa5b_c) );  
   FA1 fa5a(.xin(fa49_s), .yin(fa4a_c), .zin(zin5a), .sout(fa5a_s), .cout(fa5a_c) );  
   FA1 fa59(.xin(fa48_s), .yin(fa49_c), .zin(zin59), .sout(fa59_s), .cout(fa59_c) );  
   FA1 fa58(.xin(fa47_s), .yin(fa48_c), .zin(zin58), .sout(fa58_s), .cout(fa58_c) );  
   FA1 fa57(.xin(fa46_s), .yin(fa47_c), .zin(zin57), .sout(fa57_s), .cout(fa57_c) );  
   FA1 fa56(.xin(fa45_s), .yin(fa46_c), .zin(zin56), .sout(fa56_s), .cout(fa56_c) );  
   FA1 fa55(.xin(fa44_s), .yin(fa45_c), .zin(zin55), .sout(fa55_s), .cout(fa55_c) ); 
   FA1 fa54(.xin(fa43_s), .yin(fa44_c), .zin(zin54), .sout(fa54_s), .cout(fa54_c) );   
   FA1 fa53(.xin(fa42_s), .yin(fa43_c), .zin(zin53), .sout(fa53_s), .cout(fa53_c) );  
   FA2 fa52(.xin(fa41_s), .yin(fa42_c), .zin(zin52), .sout(fa52_s), .cout(fa52_c) );  

    wire fa51_s = ain[11] & bin[4]; 
                              
 //==========================================================================
 
    wire fa6b_s, fa6a_s, fa69_s, fa68_s, fa67_s, fa66_s, fa65_s, fa64_s, fa63_s, fa62_s;  
    wire fa6c_c, fa6b_c, fa6a_c, fa69_c, fa68_c, fa67_c, fa66_c, fa65_c, fa64_c, fa63_c, fa62_c;  

    wire zin6c = ain[0] & bin[5];
    wire zin6b = ain[1] & bin[5];
    wire zin6a = ain[2] & bin[5];
    wire zin69 = ain[3] & bin[5];
    wire zin68 = ain[4] & bin[5];
    wire zin67 = ain[5] & bin[5];
    wire zin66 = ain[6] & bin[5];
    wire zin65 = ain[7] & bin[5];
    wire zin64 = ain[8] & bin[5];
    wire zin63 = ain[9] & bin[5];    
    wire zin62 = ain[10] & bin[5]; 

                           
   FA3 fa6c(.xin(fa5b_s), .yin(fa5c_c), .zin(zin6c), .cout(fa6c_c) );  
   FA1 fa6b(.xin(fa5a_s), .yin(fa5b_c), .zin(zin6b), .sout(fa6b_s), .cout(fa6b_c) );  
   FA1 fa6a(.xin(fa59_s), .yin(fa5a_c), .zin(zin6a), .sout(fa6a_s), .cout(fa6a_c) );  
   FA1 fa69(.xin(fa58_s), .yin(fa59_c), .zin(zin69), .sout(fa69_s), .cout(fa69_c) );  
   FA1 fa68(.xin(fa57_s), .yin(fa58_c), .zin(zin68), .sout(fa68_s), .cout(fa68_c) );  
   FA1 fa67(.xin(fa56_s), .yin(fa57_c), .zin(zin67), .sout(fa67_s), .cout(fa67_c) );  
   FA1 fa66(.xin(fa55_s), .yin(fa56_c), .zin(zin66), .sout(fa66_s), .cout(fa66_c) );  
   FA1 fa65(.xin(fa54_s), .yin(fa55_c), .zin(zin65), .sout(fa65_s), .cout(fa65_c) ); 
   FA1 fa64(.xin(fa53_s), .yin(fa54_c), .zin(zin64), .sout(fa64_s), .cout(fa64_c) );   
   FA1 fa63(.xin(fa52_s), .yin(fa53_c), .zin(zin63), .sout(fa63_s), .cout(fa63_c) );  
   FA2 fa62(.xin(fa51_s), .yin(fa52_c), .zin(zin62), .sout(fa62_s), .cout(fa62_c) );  

    wire fa61_s = ain[11] & bin[5];     
                             
 //==========================================================================
 
    wire fa7b_s, fa7a_s, fa79_s, fa78_s, fa77_s, fa76_s, fa75_s, fa74_s, fa73_s, fa72_s;  
    wire fa7c_c, fa7b_c, fa7a_c, fa79_c, fa78_c, fa77_c, fa76_c, fa75_c, fa74_c, fa73_c, fa72_c; 
 
    wire zin7c = ain[0] & bin[6];
    wire zin7b = ain[1] & bin[6];
    wire zin7a = ain[2] & bin[6];
    wire zin79 = ain[3] & bin[6];
    wire zin78 = ain[4] & bin[6];
    wire zin77 = ain[5] & bin[6];
    wire zin76 = ain[6] & bin[6];
    wire zin75 = ain[7] & bin[6];
    wire zin74 = ain[8] & bin[6];
    wire zin73 = ain[9] & bin[6];    
    wire zin72 = ain[10] & bin[6]; 

                          
   FA3 fa7c(.xin(fa6b_s), .yin(fa6c_c), .zin(zin7c), .cout(fa7c_c) );  
   FA1 fa7b(.xin(fa6a_s), .yin(fa6b_c), .zin(zin7b), .sout(fa7b_s), .cout(fa7b_c) );  
   FA1 fa7a(.xin(fa69_s), .yin(fa6a_c), .zin(zin7a), .sout(fa7a_s), .cout(fa7a_c) );  
   FA1 fa79(.xin(fa68_s), .yin(fa69_c), .zin(zin79), .sout(fa79_s), .cout(fa79_c) );  
   FA1 fa78(.xin(fa67_s), .yin(fa68_c), .zin(zin78), .sout(fa78_s), .cout(fa78_c) );  
   FA1 fa77(.xin(fa66_s), .yin(fa67_c), .zin(zin77), .sout(fa77_s), .cout(fa77_c) );  
   FA1 fa76(.xin(fa65_s), .yin(fa66_c), .zin(zin76), .sout(fa76_s), .cout(fa76_c) );  
   FA1 fa75(.xin(fa64_s), .yin(fa65_c), .zin(zin75), .sout(fa75_s), .cout(fa75_c) ); 
   FA1 fa74(.xin(fa63_s), .yin(fa64_c), .zin(zin74), .sout(fa74_s), .cout(fa74_c) );   
   FA1 fa73(.xin(fa62_s), .yin(fa63_c), .zin(zin73), .sout(fa73_s), .cout(fa73_c) );  
   FA2 fa72(.xin(fa61_s), .yin(fa62_c), .zin(zin72), .sout(fa72_s), .cout(fa72_c) );  
 
    wire fa71_s = ain[11] & bin[6];  
 
 //==========================================================================
 
    wire fa8b_s, fa8a_s, fa89_s, fa88_s, fa87_s, fa86_s, fa85_s, fa84_s, fa83_s;  
    wire fa8b_c, fa8a_c, fa89_c, fa88_c, fa87_c, fa86_c, fa85_c, fa84_c, fa83_c, fa82_c; 

    wire fa8c_c = fa7b_s & fa7c_c;

   HA1 fa8b(.xin(fa7a_s), .yin(fa7b_c), .sout(fa8b_s), .cout(fa8b_c) ); 
   HA1 fa8a(.xin(fa79_s), .yin(fa7a_c), .sout(fa8a_s), .cout(fa8a_c) ); 
   HA1 fa89(.xin(fa78_s), .yin(fa79_c), .sout(fa89_s), .cout(fa89_c) ); 
   HA1 fa88(.xin(fa77_s), .yin(fa78_c), .sout(fa88_s), .cout(fa88_c) ); 
   HA1 fa87(.xin(fa76_s), .yin(fa77_c), .sout(fa87_s), .cout(fa87_c) );
   HA1 fa86(.xin(fa75_s), .yin(fa76_c), .sout(fa86_s), .cout(fa86_c) );
   HA1 fa85(.xin(fa74_s), .yin(fa75_c), .sout(fa85_s), .cout(fa85_c) ); 
   HA1 fa84(.xin(fa73_s), .yin(fa74_c), .sout(fa84_s), .cout(fa84_c) );   
   HA1 fa83(.xin(fa72_s), .yin(fa73_c), .sout(fa83_s), .cout(fa83_c) );

    wire fa82_s = fa71_s ^ fa72_c;

 //==========================================================================
 
    wire fa9b_c, fa9a_c, fa99_c, fa98_c, fa97_c, fa96_c, fa95_c, fa94_c, fa93_c;
    
    wire fa9c_c = fa8b_s & fa8c_c;
   
   FA1 fa9b(.xin(fa8a_s), .yin(fa8b_c), .zin(fa9c_c), .sout(pout[0]), .cout(fa9b_c) );
   FA1 fa9a(.xin(fa89_s), .yin(fa8a_c), .zin(fa9b_c), .sout(pout[1]), .cout(fa9a_c) );
   FA1 fa99(.xin(fa88_s), .yin(fa89_c), .zin(fa9a_c), .sout(pout[2]), .cout(fa99_c) );
   FA1 fa98(.xin(fa87_s), .yin(fa88_c), .zin(fa99_c), .sout(pout[3]), .cout(fa98_c) );
   FA1 fa97(.xin(fa86_s), .yin(fa87_c), .zin(fa98_c), .sout(pout[4]), .cout(fa97_c) );
   FA1 fa96(.xin(fa85_s), .yin(fa86_c), .zin(fa97_c), .sout(pout[5]), .cout(fa96_c) );
   FA1 fa95(.xin(fa84_s), .yin(fa85_c), .zin(fa96_c), .sout(pout[6]), .cout(fa95_c) );
   FA1 fa94(.xin(fa83_s), .yin(fa84_c), .zin(fa95_c), .sout(pout[7]), .cout(fa94_c) );
 
  // pout[8]  
   assign pout[8] =  fa82_s ^ fa83_c ^ fa94_c;

endmodule

 
 