`timescale 1ns/10ps

module sizetable(
      //input
       din,      
      //output
       size
      );
input  [9:0] din;
output [3:0] size;

reg [3:0] size;

always @(din)
begin
 if (din==0)                size=0; 
 else if (din==1)                size=1;
      else if ((din<=3)  &(din>1))    size=2;
           else if ((din<=7)  &(din>3))    size=3;
                else if ((din<=15) &(din>7))    size=4;
                     else if ((din<=31) &(din>15))   size=5;
                          else if ((din<=63) &(din>31))   size=6;   
                               else if ((din<=127)&(din>63))   size=7; 
                                    else if ((din<=255)&(din>127))  size=8;
													  else if ((din<=511)&(din>255))  size=9;
															 else if ((din<=1023)&(din>511))  size=10;
																	else                            size=0;                    
end   
    
endmodule      
