`timescale 1ns/10ps
`define INPUTSIZE3 10
`define OUTPUTSIZE3 32
module packer(
       //input                     
       clk,nrst,
       idle,                   
       den,dc,eob,
       lumenb,chromenb_u,chromenb_v,
       din,din_sign,
       //dc diff part  
       ldccode,ldclength, 
       cdccode,cdclength,  
       //ac part                    
       lcode,ccode,
       llength,clength, 
       length_bit,            
       //output
       jpg_en,                   
       jpg_out,
		 up_reg,
		 non_length,
       busy);                  
                                
input  clk,nrst;                   
input  idle;
input  den,dc,eob,lumenb,chromenb_u,chromenb_v;                        
input  [`INPUTSIZE3-1:0]  din; 
input         din_sign;                 
//dc diff part  
input  [8:0]  ldccode;
input  [3:0]  ldclength;
input  [10:0]  cdccode;
input  [3:0]  cdclength;
//ac part 
input  [15:0] lcode,ccode;               
input  [3:0]  llength,clength; 
//???????????
input  [4:0]  length_bit;

output        jpg_en;                                  
output [`OUTPUTSIZE3-1:0] jpg_out;  
output [`OUTPUTSIZE3-1:0] up_reg;
output [5:0] non_length;

             
//A block finish
output        busy;
//huffman code + sign bit + bit of size 
reg [25:0] combine_codeword;                                   

reg [3:0]  length;
reg [15:0] code;

reg [`INPUTSIZE3-1:0] codeword_lowpart;  //combineword 11bit data

always @(dc or den or lumenb or chromenb_u or chromenb_v or ldccode or lcode or cdccode or ccode or eob)
begin
   if ((lumenb & den) | (lumenb & eob)) 
      if (dc) code={ldccode,7'b0};
      else    code= lcode;
   else if (((chromenb_u | chromenb_v) & den) | ((chromenb_u | chromenb_v) & eob))   
        begin
          if (dc) code={cdccode,5'b0};          
          else    code=ccode;
        end
        else code=0;
end         

always @(dc or den or lumenb or chromenb_u or chromenb_v or ldclength or llength or cdclength or clength or eob)
begin
   if ((lumenb & den) | (lumenb & eob))
   begin 
      if (dc) length= ldclength;
      else    length= llength;
   end
   else if (((chromenb_u | chromenb_v) & den) | ((chromenb_u | chromenb_v) & eob))    
        begin
          if (dc) length= cdclength;          
          else    length= clength;
        end
        else length=0;
end         

always@(din or length_bit or din_sign)
begin
  if(length_bit==31)   codeword_lowpart=10'b0;
     else if(length_bit==1)   codeword_lowpart={~din_sign,din[0],8'b0};
          else if(length_bit==2)   codeword_lowpart={~din_sign,din[1:0],7'b0}; 
               else if(length_bit==3)   codeword_lowpart={~din_sign,din[2:0],6'b0};
                    else if(length_bit==4)   codeword_lowpart={~din_sign,din[3:0],5'b0};
                         else if(length_bit==5)   codeword_lowpart={~din_sign,din[4:0],4'b0};
                              else if(length_bit==6)   codeword_lowpart={~din_sign,din[5:0],3'b0};
                                   else if(length_bit==7)   codeword_lowpart={~din_sign,din[6:0],2'b0};
													 else if(length_bit==8)   codeword_lowpart={~din_sign,din[7:0],1'b0};
															else if(length_bit==9)   codeword_lowpart={~din_sign,din[8:0]};
																  else                     codeword_lowpart={~din_sign,9'b0};    
end

wire [3:0] length_remod=(length==4'b0)?15:length-1;

always @(length_remod or codeword_lowpart or idle or code)
begin
 if (idle)
       combine_codeword={26{1'b0}}; 
 else
   case (length_remod)
   15: combine_codeword={code[15: 0],codeword_lowpart};
   14: combine_codeword={code[15: 1],codeword_lowpart, 1'b0};
   13: combine_codeword={code[15: 2],codeword_lowpart, 2'b0};
   12: combine_codeword={code[15: 3],codeword_lowpart, 3'b0};
   11: combine_codeword={code[15: 4],codeword_lowpart, 4'b0};
   10: combine_codeword={code[15: 5],codeword_lowpart, 5'b0};
    9: combine_codeword={code[15: 6],codeword_lowpart, 6'b0};  
    8: combine_codeword={code[15: 7],codeword_lowpart, 7'b0};
    7: combine_codeword={code[15: 8],codeword_lowpart, 8'b0};    
    6: combine_codeword={code[15: 9],codeword_lowpart, 9'b0};
    5: combine_codeword={code[15:10],codeword_lowpart, 10'b0}; 
    4: combine_codeword={code[15:11],codeword_lowpart, 11'b0};
    3: combine_codeword={code[15:12],codeword_lowpart, 12'b0};
    2: combine_codeword={code[15:13],codeword_lowpart, 13'b0};  
    1: combine_codeword={code[15:14],codeword_lowpart, 14'b0};    
    default: combine_codeword={26{1'b1}};    
   endcase 
   
end 


reg  [ 5:0]  addr;
wire [63:0]  barrel_o;
reg  [31:0]  up_reg;
reg  [4:0]   codelength_temp;
wire comb_wen= den & ~idle;

wire [63:0] barrel_in=(den | eob)?{combine_codeword,38'b0} : 0;

wire [4:0] code_length=(den & ~idle) ?{1'b0,length_remod}+5'b00010+length_bit:5'b0;  

wire [5:0] addr_sum=den ? {1'b0,code_length}+addr:0;
wire [5:0] addr_eob=addr+{2'b0,length};
wire busy=(den & ~eob)?1:0;
wire overflow=eob?(addr_eob>=32):(addr_sum>=32); 
wire [5:0] non_length = addr;

always @(posedge clk or negedge nrst)
begin
  if (~nrst) addr<=0;
  else if (idle)addr<=addr;
       else if (eob & overflow) addr<=addr+{2'b0,length}-32;
            else if (overflow) addr<={1'b0,code_length}+addr-32;
                 else if (~den&eob) addr<=addr+{2'b0,length};      
                      else if (comb_wen) addr<=addr+{1'b0,code_length};
                           else addr<= addr;
end

always@(posedge clk or negedge nrst)
begin
     if(~nrst) codelength_temp<=0;
     else  codelength_temp<=code_length;
end                      
barrel_shifter barrel_shifter(.inreg(barrel_in),.shsize(addr),.outreg(barrel_o));

wire [`OUTPUTSIZE3-1:0] combine=(up_reg | barrel_o[63:32]);

wire [31:0] low_reg=barrel_o[31:0];

always @(posedge clk or negedge nrst)
begin
  if (~nrst) up_reg<=0;
       else if (idle) up_reg<=up_reg;
            else if (overflow) up_reg<=low_reg;
                 else up_reg<=combine;
end

reg [`OUTPUTSIZE3-1:0] jpg_out;
reg jpg_en;                              //jpg_out write to file signal that enable output

always @(posedge clk or negedge nrst)
begin
 if (~nrst)       jpg_en<=0;
 else             jpg_en<=overflow;        
end

always @(posedge clk or negedge nrst)
begin
 if (~nrst)       jpg_out<=0;
 else if (overflow)                          
                  jpg_out<=combine; 
 else
                  jpg_out<=0;
end

endmodule   
