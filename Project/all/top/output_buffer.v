`timescale 1ns/10ps
`define PIXEL_SIZE 8
`define WIDTH 32
`define HEIGHT 32
`define TOTAL_SIZE `WIDTH*`HEIGHT
`define BUF_SIZE 256*1024
`define DCT_IN 64
`define JPEG_IN 32
`define BUS_SIZE 32

module output_buffer(data_out,output_valid,clock,reset,write_en,data_in,ptr_out);
    parameter [1:0] out_Y=0,out_Cb=1,out_Cr=2;
    
    output [`BUS_SIZE-1:0]data_out;
    output output_valid;

    reg [`BUS_SIZE-1:0]data_out;
    reg output_valid;
    
    input clock;
    input reset;
    input write_en;
    input [`JPEG_IN-1:0]data_in;
	input [16:0] ptr_out;
    
    reg [16:0] ptr_in;
    //reg [16:0] ptr_out;
    reg [`PIXEL_SIZE-1:0]Out_buf[`BUF_SIZE-1:0];

    
    always@(posedge clock)begin       
      if(reset)begin
       //Out_buf[ptr_in]<=0;
       ptr_in<=0;
      end
      else if(write_en) begin
       //{Out_buf[ptr_in],Out_buf[ptr_in+1],Out_buf[ptr_in+2],Out_buf[ptr_in+3],Out_buf[ptr_in+4],Out_buf[ptr_in+5],Out_buf[ptr_in+6],Out_buf[ptr_in+7]}<=data_in;
       {Out_buf[ptr_in],Out_buf[ptr_in+1],Out_buf[ptr_in+2],Out_buf[ptr_in+3]}<=data_in;
	   ptr_in<=ptr_in+4;//+8;
      end 
  
    end
    
    always@(posedge clock)begin       
       if(reset)begin
          data_out<=0;
          //ptr_out<=0;
          output_valid<=0;
       end
       else if(ptr_in>ptr_out)begin    
          data_out<={Out_buf[ptr_out],Out_buf[ptr_out+1],Out_buf[ptr_out+2],Out_buf[ptr_out+3]}; 
          //ptr_out<=ptr_out+4;
          output_valid<=(ptr_in>='d5000 && ptr_in<'d5004)?1:0;
       end 
       else begin
          output_valid<=0;
       end
    end
    

endmodule
