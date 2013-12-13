//==============================================
//     luminance AC coefficients 
//==============================================
`timescale 1ns/10ps

module lactable(//input
                  run,size,
                  
                //output
                  code, length);
input [3:0] run;
input [3:0] size;

output [15:0] code;
output [3:0] length;

wire [7:0] ptr={run,4'b0}+{4'b0,size};
reg [15:0] code;
reg [3:0] length; 

always @(ptr)
begin
 case(ptr)
    //---------- code =0 ---------------
    0: begin //EOB
           code=16'b1010_0000_0000_0000;
           length=4'b0100;
       end
    1: begin 
           code=16'b0000_0000_0000_0000;
           length=4'b0010;
       end
    2: begin
           code=16'b0100_0000_0000_0000;
           length=4'b0010;
       end
    3: begin
           code=16'b1000_0000_0000_0000;
           length=4'b0011;
       end
    4: begin
           code=16'b1011_0000_0000_0000;
           length=4'b0100;
       end
    5: begin
           code=16'b1101_0000_0000_0000;
           length=4'b0101;
       end
    6: begin
           code=16'b1111_0000_0000_0000;
           length=4'b0111;
       end
    7: begin
           code=16'b1111_1000_0000_0000;
           length=4'b1000;
       end
    8: begin
           code=16'b1111_1101_1000_0000;
           length=4'b1010;
       end
    9: begin
           code=16'b1111_1111_1000_0010;
           length=4'b0000;
       end
   10: begin
           code=16'b1111_1111_1000_0011;
           length=4'b0000;
       end    
     //---------- code =1 -----------------      
   17: begin
           code=16'b1100_0000_0000_0000;
           length=4'b0100;
       end
   18: begin
           code=16'b1101_1000_0000_0000;
           length=4'b0101;
       end
   19: begin
           code=16'b1111_0010_0000_0000;
           length=4'b0111;
       end
   20: begin
           code=16'b1111_1011_0000_0000;
           length=4'b1001;
       end
   21: begin
           code=16'b1111_1110_1100_0000;
           length=4'b1011;
       end
   22: begin
           code=16'b1111_1111_1000_0100;
           length=4'b0000;
       end
   23: begin
           code=16'b0000_0000_1000_0101;
           length=4'b0000;
       end
   24: begin
           code=16'b1111_1111_1000_0110;
           length=4'b0000;
       end
   25: begin
           code=16'b1111_1111_1000_0111;
           length=4'b0000;
       end
   26: begin
           code=16'b1111_1111_1000_1000;
           length=4'b0000;
       end
   //----------- code =2 -----------------
   33: begin
           code=16'b1110_0000_0000_0000;
           length=4'b0101;
       end
   34: begin
           code=16'b1111_1001_0000_0000;
           length=4'b1000;
       end
   35: begin
           code=16'b1111_1101_1100_0000;
           length=4'b1010;
       end
   36: begin
           code=16'b1111_1111_0100_0000;
           length=4'b1100;
       end
   37: begin
           code=16'b1111_1111_1000_1001;
           length=4'b0000;
       end
   38: begin
           code=16'b1111_1111_1000_1010;
           length=4'b0000;
       end
   39: begin
           code=16'b1111_1111_1000_1011;
           length=4'b0000;
       end
   40: begin
           code=16'b1111_1111_1000_1100;
           length=4'b0000;
       end
   41: begin
           code=16'b1111_1111_1000_1101;
           length=4'b0000;
       end
   42: begin
           code=16'b1111_1111_1000_1110;
           length=4'b0000;
       end     
     //--------- code=16'b 3 -------------
   49: begin
           code=16'b1110_1000_0000_0000;
           length=4'b0110;
       end
   50: begin
           code=16'b1111_1011_1000_0000;
           length=4'b1001;
       end
   51: begin
           code=16'b1111_1111_0101_0000;
           length=4'b1100;
       end
   52: begin
           code=16'b1111_1111_1000_1111;
           length=4'b0000;
       end
   53: begin
           code=16'b1111_1111_1001_0000;
           length=4'b0000;
       end
   54: begin
           code=16'b1111_1111_1001_0001;
           length=4'b0000;
       end
   55: begin
           code=16'b1111_1111_1001_0010;
           length=4'b0000;
       end
   56: begin
           code=16'b1111_1111_1001_0011;
           length=4'b0000;
       end
   57: begin
           code=16'b1111_1111_1001_0100;
           length=4'b0000;
       end
   58: begin
           code=16'b1111_1111_1001_0101;
           length=4'b0000;
       end      
   //--------- code=16'b 4 -------------
   65: begin
           code=16'b1110_1100_0000_0000;
           length=4'b0110;
       end
   66: begin
           code=16'b1111_1110_0000_0000;
           length=4'b1010;
       end
   67: begin
           code=16'b1111_1111_1001_0110;
           length=4'b0000;
       end
   68: begin
           code=16'b1111_1111_1001_0111;
           length=4'b0000;
       end
   69: begin
           code=16'b1111_1111_1001_1000;
           length=4'b0000;
       end
   70: begin
           code=16'b1111_1111_1001_1001;
           length=4'b0000;
       end
   71: begin
           code=16'b1111_1111_1001_1010;
           length=4'b0000;
       end
   72: begin
           code=16'b1111_1111_1001_1011;
           length=4'b0000;
       end
   73: begin
           code=16'b1111_1111_1001_1100;
           length=4'b0000;
       end
   74: begin
           code=16'b1111_1111_1001_1101;
           length=4'b0000;
       end
    //--------- code=16'b 5 -------------
     
   81: begin
           code=16'b1111_0100_0000_0000;
           length=4'b0111;
       end
   82: begin
           code=16'b1111_1110_1110_0000;
           length=4'b1011;
       end
   83: begin
           code=16'b1111_1111_1001_1110;
           length=4'b0000;
       end
   84: begin
           code=16'b1111_1111_1001_1111;
           length=4'b0000;
       end
   85: begin
           code=16'b1111_1111_1010_0000;
           length=4'b0000;
       end
   86: begin
           code=16'b1111_1111_1010_0001;
           length=4'b0000;
       end
   87: begin
           code=16'b1111_1111_1010_0010;
           length=4'b0000;
       end
   88: begin
           code=16'b1111_1111_1010_0011;
           length=4'b0000;
       end
   89: begin
           code=16'b1111_1111_1010_0100;
           length=4'b0000;
       end
   90: begin
           code=16'b1111_1111_1010_0101;
           length=4'b0000;
       end     
      //--------- code=16'b 6 -------------
   97: begin
           code=16'b1111_0110_0000_0000;
           length=4'b0111;
       end
   98: begin
           code=16'b1111_1111_0110_0000;
           length=4'b1100;
       end
   99: begin
           code=16'b1111_1111_1010_0110;
           length=4'b0000;
       end
  100: begin
           code=16'b1111_1111_1010_0111;
           length=4'b0000;
       end
  101: begin
           code=16'b1111_1111_1010_1000;
           length=4'b0000;
       end
  102: begin
           code=16'b1111_1111_1010_1001;
           length=4'b0000;
       end
  103: begin
           code=16'b1111_1111_1010_1010;
           length=4'b0000;
       end
  104: begin
           code=16'b1111_1111_1010_1011;
           length=4'b0000;
       end
  105: begin
           code=16'b1111_1111_1010_1100;
           length=4'b0000;
       end
  106: begin
           code=16'b1111_1111_1010_1101;
           length=4'b0000;
       end              
 
    //--------- code=16'b 7 -------------
  113: begin
           code=16'b1111_1010_0000_0000;
           length=4'b1000;
       end
  114: begin
           code=16'b1111_1111_0111_0000;
           length=4'b1100;
       end
  115: begin
           code=16'b1111_1111_1010_1110;
           length=4'b0000;
       end
  116: begin
           code=16'b1111_1111_1010_1111;
           length=4'b0000;
       end
  117: begin
           code=16'b1111_1111_1011_0000;
           length=4'b0000;
       end
  118: begin
           code=16'b1111_1111_1011_0001;
           length=4'b0000;
       end
  119: begin
           code=16'b1111_1111_1011_0010;
           length=4'b0000;
       end
  120: begin
           code=16'b1111_1111_1011_0011;
           length=4'b0000;
       end
  121: begin
           code=16'b1111_1111_1011_0100;
           length=4'b0000;
       end
  122: begin
           code=16'b1111_1111_1011_0101;
           length=4'b0000;
       end                
   //--------- code=16'b 8 -------------
      
  129: begin
           code=16'b1111_1100_0000_0000;
           length=4'b1001;
       end
  130: begin
           code=16'b1111_1111_1000_0000;
           length=4'b1111;
       end
  131: begin
           code=16'b1111_1111_1011_0110;
           length=4'b0000;
       end
  132: begin
           code=16'b1111_1111_1011_0111;
           length=4'b0000;
       end
  133: begin
           code=16'b1111_1111_1011_1000;
           length=4'b0000;
       end
  134: begin
           code=16'b1111_1111_1011_1001;
           length=4'b0000;
       end
  135: begin
           code=16'b1111_1111_1011_1010;
           length=4'b0000;
       end
  136: begin
           code=16'b1111_1111_1011_1011;
           length=4'b0000;
       end
  137: begin
           code=16'b1111_1111_1011_1100;
           length=4'b0000;
       end
  138: begin
           code=16'b1111_1111_1011_1101;
           length=4'b0000;
       end                      
   //--------- code=16'b 9 -------------
  145: begin
           code=16'b1111_1100_1000_0000;
           length=4'b1001;
       end
  146: begin
           code=16'b1111_1111_1011_1110;
           length=4'b0000;
       end
  147: begin
           code=16'b1111_1111_1011_1111;
           length=4'b0000;
       end
  148: begin
           code=16'b1111_1111_1100_0000;
           length=4'b0000;
       end
  149: begin
           code=16'b1111_1111_1100_0001;
           length=4'b0000;
       end
  150: begin
           code=16'b1111_1111_1100_0010;
           length=4'b0000;
       end
  151: begin
           code=16'b1111_1111_1100_0011;
           length=4'b0000;
       end
  152: begin
           code=16'b1111_1111_1100_0100;
           length=4'b0000;
       end
  153: begin
           code=16'b1111_1111_1100_0101;
           length=4'b0000;
       end
  154: begin
           code=16'b1111_1111_1100_0110;
           length=4'b0000;
       end             
            
  //--------- code=16'b 10 -------------
  161: begin
           code=16'b1111_1101_0000_0000;
           length=4'b1001;
       end
  162: begin
           code=16'b1111_1111_1100_0111;
           length=4'b0000;
       end
  163: begin
           code=16'b1111_1111_1100_1000;
           length=4'b0000;
       end
  164: begin
           code=16'b1111_1111_1100_1001;
           length=4'b0000;
       end
  165: begin
           code=16'b1111_1111_1100_1010;
           length=4'b0000;
       end
  166: begin
           code=16'b1111_1111_1100_1011;
           length=4'b0000;
       end
  167: begin
           code=16'b1111_1111_1100_1100;
           length=4'b0000;
       end
  168: begin
           code=16'b1111_1111_1100_1101;
           length=4'b0000;
       end
  169: begin
           code=16'b1111_1111_1100_1110;
           length=4'b0000;
       end
  170: begin
           code=16'b1111_1111_1100_1111;
           length=4'b0000;
       end                            
   
   //--------- code=16'b 11 -------------
  177: begin
           code=16'b1111_1110_0100_0000;
           length=4'b1010;
       end
  178: begin
           code=16'b1111_1111_1101_0000;
           length=4'b0000;
       end
  179: begin
           code=16'b1111_1111_1101_0001;
           length=4'b0000;
       end
  180: begin
           code=16'b1111_1111_1101_0010;
           length=4'b0000;
       end
  181: begin
           code=16'b1111_1111_1101_0011;
           length=4'b0000;
       end
  182: begin
           code=16'b1111_1111_1101_0100;
           length=4'b0000;
       end
  183: begin
           code=16'b1111_1111_1101_0101;
           length=4'b0000;
       end
  184: begin
           code=16'b1111_1111_1101_0110;
           length=4'b0000;
       end
  185: begin
           code=16'b1111_1111_1101_0111;
           length=4'b0000;
       end
  186: begin
           code=16'b1111_1111_1101_1000;
           length=4'b0000;
       end                                                     
  //----------- code=16'b 12 -------------
  193: begin
           code=16'b1111_1110_1000_0000;
           length=4'b1010;
       end
  194: begin
           code=16'b1111_1111_1101_1001;
           length=4'b0000;
       end
  195: begin
           code=16'b1111_1111_1101_1010;
           length=4'b0000;
       end
  196: begin
           code=16'b1111_1111_1101_1011;
           length=4'b0000;
       end
  197: begin
           code=16'b1111_1111_1101_1100;
           length=4'b0000;
       end
  198: begin
           code=16'b1111_1111_1101_1101;
           length=4'b0000;
       end
  199: begin
           code=16'b1111_1111_1101_1110;
           length=4'b0000;
       end
  200: begin
           code=16'b1111_1111_1101_1111;
           length=4'b0000;
       end
  201: begin
           code=16'b1111_1111_1110_0000;
           length=4'b0000;
       end
  202: begin
           code=16'b1111_1111_1110_0001;
           length=4'b0000;
       end                      
 
 //----------- code=16'b 13 ---------------
  209: begin
           code=16'b1111_1111_0000_0000;
           length=4'b1011;
       end
  210: begin
           code=16'b1111_1111_1110_0010;
           length=4'b0000;
       end
  211: begin
           code=16'b1111_1111_1110_0011;
           length=4'b0000;
       end
  212: begin
           code=16'b1111_1111_1110_0100;
           length=4'b0000;
       end
  213: begin
           code=16'b1111_1111_1110_0101;
           length=4'b0000;
       end
  214: begin
           code=16'b1111_1111_1110_0110;
           length=4'b0000;
       end
  215: begin
           code=16'b1111_1111_1110_0111;
           length=4'b0000;
       end
  216: begin
           code=16'b1111_1111_1110_1000;
           length=4'b0000;
       end
  217: begin
           code=16'b1111_1111_1110_1001;
           length=4'b0000;
       end
  218: begin
           code=16'b1111_1111_1110_1010;
           length=4'b0000;
       end              
    //--------- code=16'b 14 -------------
  225: begin
           code=16'b1111_1111_1110_1011;
           length=4'b0000;
       end
  226: begin
           code=16'b1111_1111_1110_1100;
           length=4'b0000;
       end
  227: begin
           code=16'b1111_1111_1110_1101;
           length=4'b0000;
       end
  228: begin
           code=16'b1111_1111_1110_1110;
           length=4'b0000;
       end
  229: begin
           code=16'b1111_1111_1110_1111;
           length=4'b0000;
       end
  230: begin
           code=16'b1111_1111_1111_0000;
           length=4'b0000;
       end
  231: begin
           code=16'b1111_1111_1111_0001;
           length=4'b0000;
       end
  232: begin
           code=16'b1111_1111_1111_0010;
           length=4'b0000;
       end
  233: begin
           code=16'b1111_1111_1111_0011;
           length=4'b0000;
       end
  234: begin
           code=16'b1111_1111_1111_0100;
           length=4'b0000;
       end                      
   //--------- code = 16'b 15-----------
  240: begin
           code=16'b1111_1111_0010_0000;
           length=4'b1011;
       end
  241: begin
           code=16'b1111_1111_1111_0101;
           length=4'b0000;
       end
  242: begin
           code=16'b1111_1111_1111_0110;
           length=4'b0000;
       end
  243: begin
           code=16'b1111_1111_1111_0111;
           length=4'b0000;
       end
  244: begin
           code=16'b1111_1111_1111_1000;
           length=4'b0000;
       end
  245: begin
           code=16'b1111_1111_1111_1001;
           length=4'b0000;
       end
  246: begin
           code=16'b1111_1111_1111_1010;
           length=4'b0000;
       end
  247: begin
           code=16'b1111_1111_1111_1011;
           length=4'b0000;
       end
  248: begin
           code=16'b1111_1111_1111_1100;
           length=4'b0000;
       end
  249: begin
           code=16'b1111_1111_1111_1101;
           length=4'b0000;
       end                  
  250: begin
           code=16'b1111_1111_1111_1110;
           length=4'b0000;
       end      
  default: begin
           code=16'b1111_1111_1111_1111;
           length=4'b1111;
           end        
   endcase
end 

endmodule      
