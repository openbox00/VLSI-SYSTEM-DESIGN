`timescale 1ns/10ps

module cactable(//input
                  run,size,
                  
                //output
                  code,length);
input [3:0] run;
input [3:0] size;

output [15:0] code;
output [3:0]  length;

wire [7:0] ptr={run,4'b0}+{4'b0,size};
reg [15:0] code;
reg [3:0] length;

   always @(ptr)
      begin
       case(ptr) 
          //---------- code =0 --------------- 
          0 : begin//EOB 
                   code =16'b0000000000000000;
                   length =4'b0010;
              end     
          1 : begin
                   code =16'b0100000000000000;
                   length =4'b0010;
              end     
          2 : begin
                   code =16'b1000000000000000;
                   length =4'b0011;
              end     
          3 : begin
                   code =16'b1010000000000000;
                   length =4'b0100;
              end     
          4 : begin
                   code =16'b1100000000000000;
                   length =4'b0101;
              end     
          5 : begin
                   code =16'b1100100000000000;
                   length =4'b0101;
              end     
          6 : begin
                   code =16'b1110000000000000;
                   length =4'b0110; 
              end     
          7 : begin
                   code =16'b1111000000000000;
                   length =4'b0111;
              end     
          8 : begin
                   code =16'b1111101000000000;
                   length =4'b1001;
              end     
          9 : begin
                   code =16'b1111110110000000;
                   length =4'b1010;
               end    
          10 : begin
                   code =16'b1111111101000000;
                   length =4'b1100; 
               end    
          //---------- code =1 -----------------
          17 : begin
                   code =16'b1011000000000000;
                   length =4'b0100;
               end    
          18 : begin
                   code =16'b1110010000000000;
                   length =4'b0110;
               end    
          19 : begin
                   code =16'b1111011000000000;
                   length =4'b1000;
               end    
          20 : begin
                   code =16'b1111101010000000;
                   length =4'b1001;
               end    
          21 : begin
                   code =16'b1111111011000000;
                   length =4'b1011;
               end     
          22 : begin
                   code =16'b1111111101010000;
                   length =4'b1100;
               end    
          23 : begin
                   code =16'b1111111110001000;
                   length =4'b0000;      
               end    
          24 : begin
                   code =16'b1111111110001001;
                   length =4'b0000;
               end    
          25 : begin
                   code =16'b1111111110001010;
                   length =4'b0000;
               end     
          26 : begin
                   code =16'b1111111110001011;
                   length =4'b0000;
               end
          //----------- code =2 -----------------
          33 : begin
                   code =16'b1101000000000000;
                   length =4'b0101;
               end    
          34 : begin
                   code =16'b1111011100000000;
                   length =4'b1000;
               end    
          35 : begin
                   code =16'b1111110111000000;
                   length =4'b1010;
               end    
          36 : begin
                   code =16'b1111111101100000;
                   length =4'b1100;
               end    
          37 : begin
                   code =16'b1111111110000100;
                   length =4'b1111;
               end    
          38 : begin
                   code =16'b1111111110001100;
                   length =4'b0000;
               end    
          39 : begin
                   code =16'b1111111110001101;
                   length =4'b0000;
               end    
          40 : begin
                   code =16'b1111111110001110;
                   length =4'b0000;
               end   
          41 : begin
                   code =16'b1111111110001111;
                   length =4'b0000;
               end    
          42 : begin
                   code =16'b1111111110010000;
                   length =4'b0000;
               end
          //--------- code=16'b 3 -------------   
          49 : begin
                   code =16'b1101100000000000;
                   length =4'b0101;
               end    
          50 : begin
                   code =16'b1111100000000000;
                   length =4'b1000;
               end    
          51 : begin
                   code =16'b1111111000000000;
                   length =4'b1010;
               end    
          52 : begin
                   code =16'b1111111101110000;
                   length =4'b1100;
               end    
          53 : begin
                   code =16'b1111111110010001;
                   length =4'b0000;
               end    
          54 : begin
                   code =16'b1111111110010010;
                   length =4'b0000;
               end    
          55 : begin
                   code =16'b1111111110010011;
                   length =4'b0000;
               end    
          56 : begin
                   code =16'b1111111110010100;
                   length =4'b0000;
               end    
          57 : begin
                   code =16'b1111111110010101;
                   length =4'b0000;
               end    
          58 : begin
                   code =16'b1111111110010110;
                   length =4'b0000;
               end   
          //--------- code=16'b 4 ------------- 
          65 : begin
                   code =16'b1110100000000000;
                   length =4'b0110;
               end    
          66 : begin
                   code =16'b1111101100000000;
                   length =4'b1001;
               end    
          67 : begin
                   code =16'b1111111110010111;
                   length =4'b0000;
               end    
          68 : begin
                   code =16'b1111111110011000;
                   length =4'b0000;
               end   
          69 : begin
                   code =16'b1111111110011001;
                   length =4'b0000;
               end    
          70 : begin
                   code =16'b1111111110011010;
                   length =4'b0000;
               end    
          71 : begin
                   code =16'b1111111110011011;
                   length =4'b0000;
               end    
          72 : begin
                   code =16'b1111111110011100;
                   length =4'b0000;
               end    
          73 : begin
                   code =16'b1111111110011101;
                   length =4'b0000;
               end    
          74 : begin
                   code =16'b1111111110011110;
                   length =4'b0000;
               end 
          //--------- code=16'b 5 -------------   
          81 : begin
                   code =16'b1110110000000000;
                   length =4'b0110;
               end    
          82 : begin
                   code =16'b1111111001000000;
                   length =4'b1010;
               end    
          83 : begin
                   code =16'b1111111110011111;
                   length =4'b0000;
               end    
          84 : begin
                   code =16'b1111111110100000;
                   length =4'b0000;
               end    
          85 : begin
                   code =16'b1111111110100001;
                   length =4'b0000;
               end    
          86 : begin
                   code =16'b1111111110100010;
                   length =4'b0000;
               end    
          87 : begin
                   code =16'b1111111110100011;
                   length =4'b0000;
               end    
          88 : begin
                   code =16'b1111111110100100;
                   length =4'b0000;
               end    
          89 : begin
                   code =16'b1111111110100101;
                   length =4'b0000;
               end    
          90 : begin
                   code =16'b1111111110100110;
                   length =4'b0000;
               end 
          //--------- code=16'b 6 -------------   
          97 : begin
                   code =16'b1111001000000000;
                   length =4'b0111;
               end    
          98 : begin
                   code =16'b1111111011100000;
                   length =4'b1011;
               end    
          99 : begin
                   code =16'b1111111110100111;
                   length =4'b0000;
               end    
          100 : begin
                   code =16'b1111111110101000;
                   length =4'b0000;
               end    
          101 : begin
                   code =16'b1111111110101001;
                   length =4'b0000;
                end   
          102 : begin
                   code =16'b1111111110101010;
                   length =4'b0000;
                end   
          103 : begin
                   code =16'b1111111110101011;
                   length =4'b0000; 
                end   
          104 : begin
                   code =16'b1111111110101100;
                   length =4'b0000;
                end   
          105 : begin
                   code =16'b1111111110101101;
                   length =4'b0000;
                end   
          106 : begin
                   code =16'b1111111110101110;
                   length =4'b0000;
                end  
          //--------- code=16'b 7 -------------
          113 : begin
                    code =16'b1111010000000000;
                    length =4'b0111;
                end    
          114 : begin
                    code =16'b1111111100000000;
                    length =4'b1011;
                end    
          115 : begin
                    code =16'b1111111110101111;
                    length =4'b0000;
                end   
          116 : begin
                    code =16'b1111111110110000;
                    length =4'b0000;
                end  
          117 : begin
                    code =16'b1111111110110001;
                    length =4'b0000;
                end    
          118 : begin
                    code =16'b1111111110110010;
                    length =4'b0000;
                end    
          119 : begin
                    code =16'b1111111110110011;
                    length =4'b0000;
                end    
          120 : begin
                    code =16'b1111111110110100;
                    length =4'b0000;
                end    
          121 : begin
                    code =16'b1111111110110101;
                    length =4'b0000;
                end    
          122 : begin
                    code =16'b1111111110110110;
                    length =4'b0000;
                end  
          //--------- code=16'b 8 -------------  
          129 : begin
                    code =16'b1111100100000000;
                    length =4'b1000;
                end    
          130 : begin
                    code =16'b1111111110110111;
                    length =4'b0000;
                end   
          131 : begin
                    code =16'b1111111110111000;
                    length =4'b0000;
                end    
          132 : begin
                    code =16'b1111111110111001;
                    length =4'b0000;
                end    
          133 : begin
                    code =16'b1111111110111010;
                    length =4'b0000;
                end    
          134 : begin
                    code =16'b1111111110111011;
                    length =4'b0000;
                end    
          135 : begin
                    code =16'b1111111110111100;
                    length =4'b0000;
                end    
          136 : begin
                   code =16'b1111111110111101;
                   length =4'b0000;
                end   
          137 : begin
                   code =16'b1111111110111110;
                   length =4'b0000;
                end   
          138 : begin
                   code =16'b1111111110111111;
                   length =4'b0000;
                end 
          //--------- code=16'b 9 ------------- 
          145 : begin
                   code =16'b1111101110000000;
                   length =4'b1001;
                end   
          146 : begin
                    code =16'b1111111111000000;
                    length =4'b0000;
                end    
          147 : begin
                    code =16'b1111111111000001;
                    length =4'b0000;
                end    
          148 : begin
                    code =16'b1111111111000010;
                    length =4'b0000;
                end    
          149 : begin
                    code =16'b1111111111000011;
                    length =4'b0000;
                end    
          150 : begin
                    code =16'b1111111111000100;
                    length =4'b0000;
                end    
          151 : begin
                    code =16'b1111111111000101;
                    length =4'b0000;
                end    
          152 : begin
                    code =16'b1111111111000110;
                    length =4'b0000;
                end    
          153 : begin
                    code =16'b1111111111000111;
                    length =4'b0000;
                end    
          154 : begin
                    code =16'b1111111111001000;
                    length =4'b0000;
                end
          //--------- code=16'b 10 -------------    
          161 : begin
                    code =16'b1111110000000000;
                    length =4'b1001;
                end    
          162 : begin
                    code =16'b1111111111001001;
                    length =4'b0000;
                end    
          163 : begin
                    code =16'b1111111111001010;
                    length =4'b0000;
                end    
          164 : begin
                    code =16'b1111111111001011;
                    length =4'b0000;
                end    
          165 : begin
                    code =16'b1111111111001100;
                    length =4'b0000;
                end   
          166 : begin
                    code =16'b1111111111001101;
                    length =4'b0000;
                end    
          167 : begin
                    code =16'b1111111111001110;
                    length =4'b0000;
                end    
          168 : begin
                    code =16'b1111111111001111;
                    length =4'b0000;
                end    
          169 : begin
                    code =16'b1111111111010000;
                    length =4'b0000;
                end    
          170 : begin
                    code =16'b1111111111010001;
                    length =4'b0000;
                end 
          //--------- code=16'b 11 -------------   
          177 : begin
                    code =16'b1111110010000000;
                    length =4'b1001;
                end    
          178 : begin
                    code =16'b1111111111010010;
                    length =4'b0000;
                end    
          179 : begin
                    code =16'b1111111111010011;
                    length =4'b0000;
                end    
          180 : begin
                    code =16'b1111111111010100;
                    length =4'b0000;
                end    
          181 : begin
                    code =16'b1111111111010101;
                    length =4'b0000;
                end    
          182 : begin
                    code =16'b1111111111010110;
                    length =4'b0000;
                end    
          183 : begin
                    code =16'b1111111111010111;
                    length =4'b0000;
                end    
          184 : begin
                    code =16'b1111111111011000;
                    length =4'b0000;
                end    
          185 : begin
                    code =16'b1111111111011001;
                    length =4'b0000;
                end    
          186 : begin
                    code =16'b1111111111011010;
                    length =4'b0000;
                end 
          //--------- code=16'b 12 -------------   
          193 : begin
                    code =16'b1111110100000000;
                    length =4'b1001;
                end    
          194 : begin
                    code =16'b1111111111011011;
                    length =4'b0000;
                end    
          195 : begin
                    code =16'b1111111111011100;
                    length =4'b0000;
                end     
          196 : begin
                    code =16'b1111111111011101;
                    length =4'b0000;
                end    
          197 : begin
                    code =16'b1111111111011110;
                    length =4'b0000;
                end    
          198 : begin
                    code =16'b1111111111011111;
                    length =4'b0000;
                end    
          199 : begin
                    code =16'b1111111111100000;
                    length =4'b0000;
                end    
          200 : begin
                    code =16'b1111111111100001;
                    length =4'b0000;
                end    
          201 : begin
                    code =16'b1111111111100010;
                    length =4'b0000;
                end                     
          202 : begin
                    code =16'b1111111111100011;
                    length =4'b0000;
                end 
          //----------- code=16'b 13 ---------------   
          209 : begin
                    code =16'b1111111100100000;
                    length =4'b1011;
                end    
          210 : begin
                    code =16'b1111111111100100;
                    length =4'b0000;
                end    
          211 : begin
                    code =16'b1111111111100101;
                    length =4'b0000;
                end    
          212 : begin
                    code =16'b1111111111100110;
                    length =4'b0000;
                end    
          213 : begin
                    code =16'b1111111111100111;
                    length =4'b0000;
                end    
          214 : begin
                    code =16'b1111111111101000;
                    length =4'b0000;
                end    
          215 : begin
                    code =16'b1111111111101001;
                    length =4'b0000;
                end    
          216 : begin
                    code =16'b1111111111101010;
                    length =4'b0000;
                end    
          217 : begin
                   code =16'b1111111111101011;
                   length =4'b0000;
                end   
          218 : begin
                   code =16'b1111111111101100;
                   length =4'b0000;
                end
          //--------- code=16'b 14 -------------    
          225 : begin
                    code =16'b1111111110000000;
                    length =4'b1110;
                end    
          226 : begin
                    code =16'b1111111111101101;
                    length =4'b0000;
                end    
          227 : begin
                    code =16'b1111111111101110;
                    length =4'b0000;
                end    
          228 : begin
                    code =16'b1111111111101111;
                    length =4'b0000;
                end     
          229 : begin
                    code =16'b1111111111110000;
                    length =4'b0000;
                end    
          230 : begin
                    code =16'b1111111111110001;
                    length =4'b0000;
                end    
          231 : begin
                    code =16'b1111111111110010;
                    length =4'b0000;
                end    
          232 : begin
                    code =16'b1111111111110011;
                    length =4'b0000;
                end    
          233 : begin
                   code =16'b1111111111110100;
                   length =4'b0000;
                end   
          234 : begin
                   code =16'b1111111111110101;
                   length =4'b0000;
                end  
           //--------- code =16'b 15 ---------- 
          240 : begin
                    code =16'b1111111010000000;
                    length =4'b1010;
                end    
          241 : begin
                    code =16'b1111111110000110;
                    length =4'b1111;
                end    
          242 : begin
                    code =16'b1111111111110110;
                    length =4'b0000;
                end     
          243 : begin
                    code =16'b1111111111110111;
                    length =4'b0000;
                end    
          244 : begin
                    code =16'b1111111111111000;
                    length =4'b0000;
                end    
          245 : begin
                    code =16'b1111111111111001;
                    length =4'b0000;
                end    
          246 : begin
                    code =16'b1111111111111010;
                    length =4'b0000;
                end    
          247 : begin
                    code =16'b1111111111111011;
                    length =4'b0000;
                end    
          248 : begin
                    code =16'b1111111111111100;
                    length =4'b0000;
                end    
          249 : begin
                    code =16'b1111111111111101;
                    length =4'b0000;
                end    
          250 : begin
                    code =16'b1111111111111110;
                    length =4'b0000;
                end    
 
         default: begin
                    code = 16'b1111_1111_1111_1111;
                    length=4'b1111;
                  end       
            
       endcase
      end  
endmodule

