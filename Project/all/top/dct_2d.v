//+FHDR------------------------------------------------------------------  
// (C) Copyright Company National Cheng Kung University (NCKU)             
//  All Right Reserved                                                     
//-----------------------------------------------------------------------  
//  FILE NAME: dct_2d.v                                                      
//  AUTHOR: 100                                              
//  CONTACT INFORMATION: n26991784@mail.ncku.edu.tw                    
//-----------------------------------------------------------------------  
//  RELEASE VERSION: v1.0                                                  
//  VERSION DESCRIPTION:     none                    
//-----------------------------------------------------------------------  
//  RELEASE DATE: 2011-01-14                                                         
//-----------------------------------------------------------------------  
//  PURPOSE:   top module of 2D-DCT                                                           
//-----------------------------------------------------------------------  
//  PARAMETERS:   none                                                         
//         
//                               
//-FHDR------------------------------------------------------------------

`timescale 1ns / 10ps

module dct_2d(//input
              clk,
			  rst,
			  enable,
              in0,
			  in1, 
			  in2,
			  in3, 
			  in4, 
			  in5, 
			  in6, 
			  in7,
              
              //output
              out_en, //output datas are correct
              out0,
			  out1,
			  out2, 
			  out3, 
			  out4, 
			  out5, 
			  out6, 
			  out7
			  );
			  
			  
   input clk, rst, enable;
   input [11:0] in0, in1, in2, in3, in4, in5, in6, in7;
   
   output out_en;
   output [11:0] out0, out1, out2, out3, out4, out5, out6, out7;
   
   parameter 	front8=1'b0, 
				back8=1'b1; 
   
   reg nxout_en,out_en;
   reg state,nx_state;
   reg [3:0] cnt,nx_cnt; 
   reg [11:0] out0, out1, out2, out3, out4, out5, out6, out7;
   
   reg rw;
   wire [2:0] addr;
   wire [11:0] dct_in0,dct_in1,dct_in2,dct_in3,dct_in4,dct_in5,dct_in6,dct_in7;
   wire [11:0] dct_out0,dct_out1,dct_out2,dct_out3,dct_out4,dct_out5,dct_out6,dct_out7;
   wire [11:0] ram_out0,ram_out1,ram_out2,ram_out3,ram_out4,ram_out5,ram_out6,ram_out7;
   
   
   assign addr=cnt[2:0];
   assign dct_in0=cnt[3]?ram_out0:in0;
   assign dct_in1=cnt[3]?ram_out1:in1;
   assign dct_in2=cnt[3]?ram_out2:in2;
   assign dct_in3=cnt[3]?ram_out3:in3;
   assign dct_in4=cnt[3]?ram_out4:in4;
   assign dct_in5=cnt[3]?ram_out5:in5;
   assign dct_in6=cnt[3]?ram_out6:in6;
   assign dct_in7=cnt[3]?ram_out7:in7;
   
   FDCT u_dct1(
				//intput
				.data0_in(dct_in0),
				.data1_in(dct_in1),
				.data2_in(dct_in2),
				.data3_in(dct_in3),
				.data4_in(dct_in4),
				.data5_in(dct_in5),
				.data6_in(dct_in6),
				.data7_in(dct_in7),
				
				//output
				.out0(dct_out0),
				.out1(dct_out1),
				.out2(dct_out2),
				.out3(dct_out3),
				.out4(dct_out4),
				.out5(dct_out5),
				.out6(dct_out6),
				.out7(dct_out7));
            
   transram u_ram1(//intput
				     .clk(clk),
				     .rst(rst),
				     .rw(rw),
				     .addr(addr),
				     .in0(dct_out0),
				     .in1(dct_out1),
				     .in2(dct_out2),
				     .in3(dct_out3),
				     .in4(dct_out4),
				     .in5(dct_out5),
				     .in6(dct_out6),
				     .in7(dct_out7),
				
				     //output
				     .out0(ram_out0),
				     .out1(ram_out1),
				     .out2(ram_out2),
				     .out3(ram_out3),
				     .out4(ram_out4),
				     .out5(ram_out5),
				     .out6(ram_out6),
				     .out7(ram_out7));
   
   always@(posedge clk or posedge rst) begin //state reg
       if(rst) state<=front8;
       else state<=nx_state;
   end
   
   always@(state or cnt or enable)	//nextstate logic
   begin 
		if(enable) begin 	
          case(state)
           front8 : begin
                        
						if(cnt == 4'b0111) 
                        nx_state = back8;
                        else nx_state = front8;
						
					end
           back8 : begin
                       if(cnt == 4'b1111)
					   nx_state = front8;
                       else nx_state = back8;
                   end
           default : nx_state = front8;
		  endcase
		end
		else
		nx_state = front8;
		end
	

   
   always@(state)
   begin //output logic
       case(state)
           front8 : begin
                        nxout_en = 1'b0;
						rw = 1;
                    end
           back8 : begin
                        nxout_en = 1'b1;
					    rw = 0;
                   end
           default : begin
                        nxout_en = 1'b0;
						rw = 1;
                    end
       endcase
   end
   
   always@(posedge clk or posedge rst) begin //data reg
       if(rst) begin
           cnt<=4'b0000;
       end
       else begin
           cnt<=nx_cnt;
       end
   end
   
   always@(cnt) begin
   if(cnt==4'b1111)
   nx_cnt=4'b0000;
   else
   nx_cnt = cnt + 4'b0001;
   end
   
   always@(posedge clk or posedge rst) begin   //out reg
       if(rst)begin
           out0<=12'b0;
           out1<=12'b0;
           out2<=12'b0;
           out3<=12'b0;
           out4<=12'b0;
           out5<=12'b0;
           out6<=12'b0;
           out7<=12'b0;
           out_en<=1'b0;
       end
       
       else begin
          if(state==back8) begin   //cycle 8~15
             out0<=dct_out0;
             out1<=dct_out1;
             out2<=dct_out2;
             out3<=dct_out3;
             out4<=dct_out4;
             out5<=dct_out5;
             out6<=dct_out6;
             out7<=dct_out7;
             out_en<=nxout_en;
          end
          
          else begin   //cycle 0~7
             out0<=out0;
             out1<=out1;
             out2<=out2;
             out3<=out3;
             out4<=out4;
             out5<=out5;
             out6<=out6;
             out7<=out7;
             out_en<=nxout_en;
          end  
       end
   end

endmodule