//+FHDR
//2010.11.30 Y_buf,Cb_buf,Cr_buf are written along posedge clock ; but be read only when addr_out changes
//2010.11.30 change the size of buffer (8->16) 
//2010.12.01 change the size of Y_out,Cb_out,Cr_out (16->12*8)
//2010.11.30 change the size of buffer (16->8)         
//-FHDR
`timescale 1ns/10ps
`define PIXEL_SIZE 8
`define WIDTH 32
`define HEIGHT 32
`define TOTAL_SIZE `WIDTH*`HEIGHT
`define DCT_IN 96

module yuv_buffer(data_out,clock,reset,data_select,write_read,Y_in,Cb_in,Cr_in,addr_in,addr_out);
    parameter [1:0] out_Y=0,out_Cb=1,out_Cr=2;
    
    output [`DCT_IN-1:0]data_out;
    /*output [`DCT_IN-1:0]Cb_out;
    output [`DCT_IN-1:0]Cr_out;
    reg [`DCT_IN-1:0]Y_out;
    reg [`DCT_IN-1:0]Cb_out;*/
    reg [`DCT_IN-1:0]data_out;
    
    input clock;
    input reset;
    input write_read;
    input [15:0]Y_in;
    input [15:0]Cb_in;
    input [15:0]Cr_in;
    input [18:0] addr_in;
    input [18:0] addr_out;
    input [1:0]data_select; 
    //input [31:0]i;
	reg [15:0]reg_Y;
	reg [15:0]reg_Cb;
	reg [15:0]reg_Cr;
    
    reg [`PIXEL_SIZE-1:0] Y_buf[`TOTAL_SIZE-1:0];
    reg [`PIXEL_SIZE-1:0]Cb_buf[`TOTAL_SIZE-1:0];
    reg [`PIXEL_SIZE-1:0]Cr_buf[`TOTAL_SIZE-1:0];
    //integer i=0;
    
    always@(posedge clock)begin       
      
      if(write_read) begin //remove float point
       Y_buf[addr_in]<=reg_Y;
	   reg_Y<=Y_in[15:8];
       Cb_buf[addr_in]<=reg_Cb;
	   reg_Cb<=Cb_in[15:8];
       Cr_buf[addr_in]<=reg_Cr;
	   reg_Cr<=Cr_in[15:8];
      end 
      /*
      else begin
       Y_buf[addr_in]<=Y_buf[addr_in];
       Cb_buf[addr_in]<=Cb_buf[addr_in];
       Cr_buf[addr_in]<=Cr_buf[addr_in];
      end*/
             
    end
    
    always@(addr_out or data_select)begin //128 bits per output
       //$display($time,"??"); 
      case(data_select) 
       0:
         data_out={4'd0,Y_buf[addr_out],4'd0,Y_buf[addr_out+1],4'd0,Y_buf[addr_out+2],4'd0,Y_buf[addr_out+3],4'd0,Y_buf[addr_out+4],4'd0,Y_buf[addr_out+5],4'd0,Y_buf[addr_out+6],4'd0,Y_buf[addr_out+7]};
       1:
         data_out={4'd0,Cb_buf[addr_out],4'd0,Cb_buf[addr_out+1],4'd0,Cb_buf[addr_out+2],4'd0,Cb_buf[addr_out+3],4'd0,Cb_buf[addr_out+4],4'd0,Cb_buf[addr_out+5],4'd0,Cb_buf[addr_out+6],4'd0,Cb_buf[addr_out+7]};
       2:
         data_out={4'd0,Cr_buf[addr_out],4'd0,Cr_buf[addr_out+1],4'd0,Cr_buf[addr_out+2],4'd0,Cr_buf[addr_out+3],4'd0,Cr_buf[addr_out+4],4'd0,Cr_buf[addr_out+5],4'd0,Cr_buf[addr_out+6],4'd0,Cr_buf[addr_out+7]};
       default:
         data_out=0;
      endcase
    end
    

endmodule