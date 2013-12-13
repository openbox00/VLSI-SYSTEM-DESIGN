`timescale 1ns/10ps
module zzscan(//input!!! 
         clk,
         nrst,
         in1,
         in2,
         in3,
         in4,
         in5,
         in6,
         in7,
         in8,
         valid,
         //output!!!
         zzout,
         vlcden_i
			);
         
input clk,nrst,valid;
input [7:0]in1,in2,in3,in4,in5,in6,in7,in8;

output [7:0]zzout;
output vlcden_i;

reg    [3:0]STATE,NEXTSTATE;
reg    [7:0]mem[63:0];
reg    [7:0]zzout;
reg    vlcden_i;//entropy enable
reg    [5:0]ptr,nextptr;//pointer of the last key
reg    [5:0]outptr,nextoutptr;//pointer of the output
reg    finish;//finish output the data
reg    [5:0] ptr0,ptr1,ptr2,ptr3,ptr4,ptr5,ptr6,ptr7;
reg    [6:0] i;
          


parameter S0=4'b0000,S1=4'b0001,S2=4'b0010,S3=4'b0011,S4=4'b0100,S5=4'b0101,S6=4'b0110,
          S7=4'b0111,S8=4'b1000,S9=4'b1001,S13=4'b1101;
          
always@(posedge clk or negedge nrst)begin
   if (~nrst)begin
       STATE <= S0;
       ptr <= 6'b00_0000;
       outptr <= 6'b00_0000;
   end
   else begin
       STATE <= NEXTSTATE;
       ptr <= nextptr;
       outptr <= nextoutptr;
  end
end

always@(STATE or valid or finish)begin
    case(STATE)
        S0:begin 
           if(valid)
            NEXTSTATE=S1;
           else
            NEXTSTATE=S0;
        end
        S1:NEXTSTATE=S2;
        S2:NEXTSTATE=S3;
        S3:NEXTSTATE=S4;
        S4:NEXTSTATE=S5;
        S5:NEXTSTATE=S6;
        S6:NEXTSTATE=S7;
        S7:NEXTSTATE=S8;
        S8:begin
           if(finish) NEXTSTATE=S13;
           else NEXTSTATE=S9;
           end
        S9:begin
           if(finish) NEXTSTATE=S13;
           else NEXTSTATE=S9;
        end
        
        S13:NEXTSTATE=S0;
        default:NEXTSTATE=S0;
      endcase
end

 always@(posedge clk or negedge nrst) begin
    if(~nrst) for(i=0;i<=63;i=i+1) mem[i]<=8'b0;
    else if(~finish) begin
      mem[ptr0]<=in1;
      mem[ptr1]<=in2;
      mem[ptr2]<=in3;
      mem[ptr3]<=in4;
      mem[ptr4]<=in5;
      mem[ptr5]<=in6;
      mem[ptr6]<=in7;
      mem[ptr7]<=in8;       
    end
  end
  
always@(in1 or in2 or in3 or in4 or in5 or in6 or in7 or in8 or STATE or ptr or outptr)begin
    case(STATE)
        S0:begin 
           nextptr=6'b00_0000;
           nextoutptr=6'b00_0000;
           finish=1'b0;
           zzout=8'b0;
           vlcden_i=1'b0;
           ptr0=0;
           ptr1=0;
           ptr2=0;
           ptr3=0;
           ptr4=0;
           ptr5=0;
           ptr6=0;
           ptr7=0;           
        end
        S1:begin
           nextoutptr=6'b00_0000;
           finish=1'b0;
           vlcden_i=1'b0;
           ptr0=0;
           ptr1=2;
           ptr2=3;
           ptr3=9;
           ptr4=10;
           ptr5=20;
           ptr6=21;
           ptr7=35; 
           if(in7 || in8)begin
               if(in8!=8'b0)begin
                  nextptr=6'd35;
                end
               else   begin
                  nextptr=6'd21;
              end
           end
           else if(in5 || in6)begin
               if(in6!=8'b0)begin
                  nextptr=6'd20;
              end
               else   begin
                  nextptr=6'd10;
                 end
           end
           else if(in3 || in4)begin
               if(in4!=8'b0)begin
                  nextptr=6'd9;
               end
               else   begin
                  nextptr=6'd3;
               end
           end
           else if(in1 || in2)begin
               if(in2!=8'b0)begin
                  nextptr=6'd2;
               end
               else   begin
                  nextptr=6'd0;
               end
           end
           else begin
               nextptr=ptr;
           end
       end
       S2:begin
           vlcden_i=1'b0;
           nextoutptr=6'b00_0000;
           finish=1'b0;
           ptr0=1;
           ptr1=4;
           ptr2=8;
           ptr3=11;
           ptr4=19;
           ptr5=22;
           ptr6=34;
           ptr7=36; 
           if(in7 || in8)begin
               if(in8!=8'b0)begin
                   if(ptr<6'd36)
                    nextptr=6'd36;
                   else
                    nextptr=ptr;
                end
               else   begin
                  if(ptr<6'd34)
                    nextptr=6'd34;
                   else
                    nextptr=ptr;
              end
           end
           else if(in5 || in6)begin
               if(in6!=8'b0)begin
                   if(ptr<6'd22)
                    nextptr=6'd22;
                   else
                    nextptr=ptr;
              end
               else   begin
                   if(ptr<6'd19)
                    nextptr=6'd19;
                   else
                    nextptr=ptr;
                 end
           end
           else if(in3 || in4)begin
               if(in4!=8'b0)begin
                   if(ptr<6'd11)
                    nextptr=6'd11;
                   else
                    nextptr=ptr;
               end
               else   begin
                   if(ptr<6'd8)
                    nextptr=6'd8;
                   else
                    nextptr=ptr;
               end
           end
           else if(in1 || in2)begin
               if(in2!=8'b0)begin
                   if(ptr<6'd4)
                    nextptr=6'd4;
                   else
                    nextptr=ptr;
               end
               else   begin
                   if(ptr<6'd1)
                    nextptr=6'd1;
                   else
                    nextptr=ptr;
               end
           end
           else begin
               nextptr=ptr;
           end
       end
       S3:begin
           vlcden_i=1'b0;
           nextoutptr=6'b00_0000;
           finish=1'b0;
           ptr0=5;
           ptr1=7;
           ptr2=12;
           ptr3=18;
           ptr4=23;
           ptr5=33;
           ptr6=37;
           ptr7=48; 
           if(in7 || in8)begin
             if(in8!=8'b0)begin
                   if(ptr<6'd48)
                    nextptr=6'd48;
                   else
                    nextptr=ptr;
                end
               else   begin
                  if(ptr<6'd37)
                    nextptr=6'd37;
                   else
                    nextptr=ptr;
              end
           end
           else if(in5 || in6)begin
               if(in6!=8'b0)begin
                   if(ptr<6'd33)
                    nextptr=6'd33;
                   else
                    nextptr=ptr;
              end
               else   begin
                   if(ptr<6'd23)
                    nextptr=6'd23;
                   else
                    nextptr=ptr;
                 end
           end
           else if(in3 || in4)begin
               if(in4!=8'b0)begin
                   if(ptr<6'd18)
                    nextptr=6'd18;
                   else
                    nextptr=ptr;
               end
               else   begin
                   if(ptr<6'd12)
                    nextptr=6'd12;
                   else
                    nextptr=ptr;
               end
           end
           else if(in1 || in2)begin
               if(in2!=8'b0)begin
                   if(ptr<6'd7)
                    nextptr=6'd7;
                   else
                    nextptr=ptr;
               end
               else   begin
                   if(ptr<6'd5)
                    nextptr=6'd5;
                   else
                    nextptr=ptr;
               end
           end
           else begin
               nextptr=ptr;
           end

       end
       S4:begin
           vlcden_i=1'b0;
           nextoutptr=6'b00_0000;
           finish=1'b0;
           ptr0=6;
           ptr1=13;
           ptr2=17;
           ptr3=24;
           ptr4=32;
           ptr5=38;
           ptr6=47;
           ptr7=49; 
           if(in7 || in8)begin
               if(in8!=8'b0)begin
                   if(ptr<6'd49)
                    nextptr=6'd49;
                   else
                    nextptr=ptr;
                end
               else   begin
                  if(ptr<6'd47)
                    nextptr=6'd47;
                   else
                    nextptr=ptr;
              end
           end
           else if(in5 || in6)begin
               if(in6!=8'b0)begin
                   if(ptr<6'd38)
                    nextptr=6'd38;
                   else
                    nextptr=ptr;
              end
               else   begin
                   if(ptr<6'd32)
                    nextptr=6'd32;
                   else
                    nextptr=ptr;
                 end
           end
           else if(in3 || in4)begin
               if(in4!=8'b0)begin
                   if(ptr<6'd24)
                    nextptr=6'd24;
                   else
                    nextptr=ptr;
               end
               else   begin
                   if(ptr<6'd17)
                    nextptr=6'd17;
                   else
                    nextptr=ptr;
               end
           end
           else if(in1 || in2)begin
               if(in2!=8'b0)begin
                   if(ptr<6'd13)
                    nextptr=6'd13;
                   else
                    nextptr=ptr;
               end
               else   begin
                   if(ptr<6'd6)
                    nextptr=6'd6;
                   else
                    nextptr=ptr;
               end
           end
           else begin
               nextptr=ptr;
           end

       end
       S5:begin
           vlcden_i=1'b0;
           nextoutptr=6'b00_0000;
           finish=1'b0;
           ptr0=14;
           ptr1=16;
           ptr2=25;
           ptr3=31;
           ptr4=39;
           ptr5=46;
           ptr6=50;
           ptr7=57; 
           if(in7 || in8)begin
               if(in8!=8'b0)begin
                   if(ptr<6'd57)
                    nextptr=6'd57;
                   else
                    nextptr=ptr;
                end
               else   begin
                  if(ptr<6'd50)
                    nextptr=6'd50;
                   else
                    nextptr=ptr;
              end
           end
           else if(in5 || in6)begin
               if(in6!=8'b0)begin
                   if(ptr<6'd46)
                    nextptr=6'd46;
                   else
                    nextptr=ptr;
              end
               else   begin
                   if(ptr<6'd39)
                    nextptr=6'd39;
                   else
                    nextptr=ptr;
                 end
           end
           else if(in3 || in4)begin
               if(in4!=8'b0)begin
                   if(ptr<6'd31)
                    nextptr=6'd31;
                   else
                    nextptr=ptr;
               end
               else   begin
                   if(ptr<6'd25)
                    nextptr=6'd25;
                   else
                    nextptr=ptr;
               end
           end
           else if(in1 || in2)begin
               if(in2!=8'b0)begin
                   if(ptr<6'd16)
                    nextptr=6'd16;
                   else
                    nextptr=ptr;
               end
               else   begin
                   if(ptr<6'd14)
                    nextptr=6'd14;
                   else
                    nextptr=ptr;
               end
           end
           else begin
               nextptr=ptr;
           end

       end
       S6:begin
           vlcden_i=1'b0;
           nextoutptr=6'b00_0000;
           finish=1'b0;
           ptr0=15;
           ptr1=26;
           ptr2=30;
           ptr3=40;
           ptr4=45;
           ptr5=51;
           ptr6=56;
           ptr7=58; 
           if(in7 || in8)begin
               if(in8!=8'b0)begin
                   if(ptr<6'd58)
                    nextptr=6'd58;
                   else
                    nextptr=ptr;
                end
               else   begin
                  if(ptr<6'd56)
                    nextptr=6'd56;
                   else
                    nextptr=ptr;
              end
           end
           else if(in5 || in6)begin
               if(in6!=8'b0)begin
                   if(ptr<6'd51)
                    nextptr=6'd51;
                   else
                    nextptr=ptr;
              end
               else   begin
                   if(ptr<6'd45)
                    nextptr=6'd45;
                   else
                    nextptr=ptr;
                 end
           end
           else if(in3 || in4)begin
               if(in4!=8'b0)begin
                   if(ptr<6'd40)
                    nextptr=6'd40;
                   else
                    nextptr=ptr;
               end
               else   begin
                   if(ptr<6'd30)
                    nextptr=6'd30;
                   else
                    nextptr=ptr;
               end
           end
           else if(in1 || in2)begin
               if(in2!=8'b0)begin
                   if(ptr<6'd26)
                    nextptr=6'd26;
                   else
                    nextptr=ptr;
               end
               else   begin
                   if(ptr<6'd15)
                    nextptr=6'd15;
                   else
                    nextptr=ptr;
               end
           end
           else begin
               nextptr=ptr;
           end

       end
       S7:begin
           vlcden_i=1'b0;
           nextoutptr=6'b00_0000;
           finish=1'b0;
           ptr0=27;
           ptr1=29;
           ptr2=41;
           ptr3=44;
           ptr4=52;
           ptr5=55;
           ptr6=59;
           ptr7=62; 
           if(in7 || in8)begin
               if(in8!=8'b0)begin
                   if(ptr<6'd62)
                    nextptr=6'd62;
                   else
                    nextptr=ptr;
                end
               else   begin
                  if(ptr<6'd59)
                    nextptr=6'd59;
                   else
                    nextptr=ptr;
              end
           end
           else if(in5 || in6)begin
               if(in6!=8'b0)begin
                   if(ptr<6'd55)
                    nextptr=6'd55;
                   else
                    nextptr=ptr;
              end
               else   begin
                   if(ptr<6'd52)
                    nextptr=6'd52;
                   else
                    nextptr=ptr;
                 end
           end
           else if(in3 || in4)begin
               if(in4!=8'b0)begin
                   if(ptr<6'd44)
                    nextptr=6'd44;
                   else
                    nextptr=ptr;
               end
               else   begin
                   if(ptr<6'd41)
                    nextptr=6'd41;
                   else
                    nextptr=ptr;
               end
           end
           else if(in1 || in2)begin
               if(in2!=8'b0)begin
                   if(ptr<6'd29)
                    nextptr=6'd29;
                   else
                    nextptr=ptr;
               end
               else   begin
                   if(ptr<6'd27)
                    nextptr=6'd27;
                   else
                    nextptr=ptr;
               end
           end
           else begin
               nextptr=ptr;
           end

       end
       S8:begin
           ptr0=28;
           ptr1=42;
           ptr2=43;
           ptr3=53;
           ptr4=54;
           ptr5=60;
           ptr6=61;
           ptr7=63; 
           if(in7 || in8)begin
               if(in8!=8'b0)begin
                   if(ptr<6'd63)
                    nextptr=6'd63;
                   else
                    nextptr=ptr;
                end
               else   begin
                  if(ptr<6'd61)
                    nextptr=6'd61;
                   else
                    nextptr=ptr;
              end
           end
           else if(in5 || in6)begin
               if(in6!=8'b0)begin
                   if(ptr<6'd60)
                    nextptr=6'd60;
                   else
                    nextptr=ptr;
              end
               else   begin
                   if(ptr<6'd54)
                    nextptr=6'd54;
                   else
                    nextptr=ptr;
                 end
           end
           else if(in3 || in4)begin
               if(in4!=8'b0)begin
                   if(ptr<6'd53)
                    nextptr=6'd53;
                   else
                    nextptr=ptr;
               end
               else   begin
                   if(ptr<6'd43)
                    nextptr=6'd43;
                   else
                    nextptr=ptr;
               end
           end
           else if(in1 || in2)begin
               if(in2!=8'b0)begin
                   if(ptr<6'd42)
                    nextptr=6'd42;
                   else
                    nextptr=ptr;
               end
               else   begin
                   if(ptr<6'd28)
                    nextptr=6'd28;
                   else
                    nextptr=ptr;
               end
           end
           else begin
               nextptr=ptr;
           end
         zzout=mem[outptr];
         vlcden_i=1'b1;
         if(outptr==ptr)begin
         finish=1'b1;
         end
         else begin
         finish=1'b0;
         end
         nextoutptr=outptr+6'b000001;
       end
       S9:begin
         ptr0=0;
         ptr1=0;
         ptr2=0;
         ptr3=0;
         ptr4=0;
         ptr5=0;
         ptr6=0;
         ptr7=0;   
         nextptr=ptr;
         zzout=mem[outptr];
         vlcden_i=1'b1;
         if(outptr==ptr)begin
         finish=1'b1;
         end
         else begin
         finish=1'b0;
          end
         nextoutptr=outptr+6'b000001; 
          end
        
        S13:begin
              ptr0=0;
              ptr1=0;
              ptr2=0;
              ptr3=0;
              ptr4=0;
              ptr5=0;
              ptr6=0;
              ptr7=0;
              zzout=8'b1111_1111;//finish the output
              nextoutptr=6'b11_1111;
              nextptr=6'b00_0000;
              vlcden_i=1'b0;
              finish=1'b0;
          end
       default:begin
              ptr0=0;
              ptr1=0;
              ptr2=0;
              ptr3=0;
              ptr4=0;
              ptr5=0;
              ptr6=0;
              ptr7=0;
              finish=1'b0;
              vlcden_i=1'b0;
              nextptr=6'b00_0000;
              nextoutptr=6'b11_1111;
              zzout=8'b1111_1111;
       end
   endcase
end
endmodule
         
