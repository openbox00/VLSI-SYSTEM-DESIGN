`timescale 1ns/10ps        
//Luminance Chrominance DC difference Humffman Table

module dcdiff_htable( 
          //input
          size,lumenb,chromenb_u,chromenb_v,
          //output              
          lcode,llength,
          ccode,clength);    
          
input  [3:0] size;
input        lumenb,chromenb_u,chromenb_v;

output [8:0] lcode;
output [3:0] llength;
output [10:0] ccode;   
output [3:0] clength; 

reg [10:0] ccode;
reg [8:0] lcode;
reg [3:0] clength,llength;

always @(size or lumenb)
begin
 if (lumenb) begin
  case(size)
  0: begin
            lcode  =9'b0000_0000_0;
            llength=2;
     end
  1: begin
            lcode  =9'b0100_0000_0;
            llength=3;         
     end 
  2: begin
            lcode  =9'b0110_0000_0;    
            llength=3;                         
     end
  3: begin 
            lcode  =9'b1000_0000_0;   
            llength=3;              
     end
  4: begin  
            lcode  =9'b1010_0000_0;
            llength=3;
     end
  5: begin
            lcode  =9'b1100_0000_0; 
            llength=3;            
     end                 
  6: begin  
            lcode  =9'b1110_0000_0;
            llength=4;
     end
  7: begin
            lcode  =9'b1111_0000_0;               
            llength=5;                
     end
  8: begin
            lcode  =9'b1111_1000_0;  
            llength=6;             
     end
  9: begin 
            lcode  =9'b1111_1100_0;   
            llength=7;
     end
 10: begin
            lcode  =9'b1111_1110_0;  
            llength=8;             
     end          
 11: begin
            lcode  =9'b1111_1111_0;  
            llength=9;             
     end
 default: begin
            lcode  =9'b0000_0000_0;   
            llength=0;               
          end
     endcase
  end  
  else 
  begin
    lcode  =9'b0000_0000_0;   
    llength=0; 
  end 
end       

always @(size or chromenb_u or chromenb_v)
begin
 if (chromenb_u | chromenb_v) begin
  case(size)
  0: begin
            ccode  =11'b0000_0000_000;
            clength=2;
     end
  1: begin
            ccode  =11'b0100_0000_000;
            clength=2;         
     end 
  2: begin
            ccode  =11'b1000_0000_000;    
            clength=2;                        
     end
  3: begin 
            ccode  =11'b1100_0000_000;   
            clength=3;              
     end
  4: begin  
            ccode  =11'b1110_0000_000;
            clength=4;
     end
  5: begin
            ccode  =11'b1111_0000_000; //original 9'b1100_0000_0  clength=3
            clength=5;            
     end                 
  6: begin  
            ccode  =11'b1111_1000_000;//original 9'b1110_0000_0  clength=4
            clength=6;
     end
  7: begin
            ccode  =11'b1111_1100_000;//original 9'b1111_0000_0  clength=5               
            clength=7;                
     end
  8: begin
            ccode  =11'b1111_1110_000;//original 9'b1111_1000_0  clength=6  
            clength=8;             
     end
  9: begin 
            ccode  =11'b1111_1111_000;//original 9'b1111_1100_0  clength=7   
            clength=9;
     end
 10: begin
            ccode  =11'b1111_1111_100;//original 9'b1111_1111_0  clength=8  
            clength=10;             
     end          
 11: begin
            ccode  =11'b1111_1111_110;//original 9'b1111_1111_1  clength=9   
            clength=11;             
     end
 default: begin
            ccode  =11'b0000_0000_000;   
            clength=0;               
          end
  endcase
 end 
 else 
 begin
    ccode  =11'b0000_0000_000;   
    clength=0; 
 end
end       
     
endmodule          
