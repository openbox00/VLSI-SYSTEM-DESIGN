//+FHDR
//author:Chen Chun-Yu
//2010.12.06 create this file
//2010.12.06 use tb_top_buf2dct.v as base file
//2010.12.06 input a 640*480 picture and transform RGB to YCbCr
//2010.12.06 yuv_buffer->DCT->QT->ZZscan transform a 8*8 block successfully!!           
//-FHDR
`timescale 1ns/10ps
`define CYCLE    20  
//`define DATA_IN   "plant.dat"//"a_double.dat"
`define DCT_INOUT 12
`define QT_OUT 8
`define ZZ_OUT 8
`define PIXEL_SIZE 8
`define JPEG_OUT 32
`define CPU_BUS 32

module controller(clock,reset,enable,write,cpu_in,ptr_out,cpu_out,out_ready);

input  clock, reset,enable,write;
input  [`CPU_BUS-1:0]cpu_in;
input  [16:0] ptr_out;
output [`CPU_BUS-1:0]cpu_out;
output out_ready;

//reg  out_ready;
reg  [23:0] in_data;
reg  [18:0] bufaddr_in,bufaddr_out;
reg [1:0] data_select;
reg enable_dct;
reg enable_QT;

//reg [31:0]zz_count;

wire dct_valid,dct_ready;
wire [`DCT_INOUT-1:0]dct_out0,dct_out1,dct_out2,dct_out3,dct_out4,dct_out5,dct_out6,dct_out7;
wire [3:0] dct_cnt;
wire QT_valid;
wire [`QT_OUT-1:0]qt_out0,qt_out1,qt_out2,qt_out3,qt_out4,qt_out5,qt_out6,qt_out7;
wire [`ZZ_OUT-1:0]zzout;
//wire [`JPEG_OUT-1:0]jpegout;//??
wire [`JPEG_OUT-1:0] jpg_out;
wire ZZ_valid;
wire total_finish;
wire	final_enable;	
wire busy;	
wire [11:0] frame_count;

wire jpg_en;
wire [14:0] entropy_cycle;
wire [14:0] co_cycle;
//reg  [23:0] test_in [4095:0];

wire valid=controller.u_top_jpeg.data_valid;

integer i,j,k;

//initial $readmemh(`DATA_IN, test_in);

top_jpeg u_top_jpeg(
   .clock(clock), 
   .reset(reset), 
   .in_data(in_data),
   .bufaddr_in(bufaddr_in),
   .bufaddr_out(bufaddr_out),
   .data_select(data_select),
   .enable_dct(enable_dct),
   .enable_QT(enable_QT),
   .total_finish(total_finish),
	.final_enable(final_enable),
	.busy(busy),
	.frame_count(frame_count),
	.jpg_en(jpg_en),
	.jpg_out(jpg_out),
	.entropy_cycle(entropy_cycle),
	.co_cycle(co_cycle),
   .dct_valid(dct_valid),
   .dct_ready(dct_ready),
   .dct_out0(dct_out0),
   .dct_out1(dct_out1),
   .dct_out2(dct_out2),
   .dct_out3(dct_out3),
   .dct_out4(dct_out4),
   .dct_out5(dct_out5),
   .dct_out6(dct_out6),
   .dct_out7(dct_out7),
   .dct_cnt(dct_cnt),
   .QT_valid(QT_valid),
   .ZZ_valid(ZZ_valid),
   .qt_out0(qt_out0), 
   .qt_out1(qt_out1), 
   .qt_out2(qt_out2), 
   .qt_out3(qt_out3),
   .qt_out4(qt_out4),
   .qt_out5(qt_out5), 
   .qt_out6(qt_out6), 
   .qt_out7(qt_out7),
   .zzout(zzout),
   .jpegout()//jpegout)
   );
   
   output_buffer u_output_buffer(
		.data_out(cpu_out),
		.output_valid(out_ready),
		.clock(clock),
		.reset(reset),
		.write_en(jpg_en),
		.data_in(jpg_out),
		.ptr_out(ptr_out)
		);

 
//always #(`CYCLE/2) clock=~clock;

initial $monitor($time,"  entropy encode:%h , enable=%b;"/*   %b(dct)....zzout=%h*/,jpg_out,jpg_en );//,enable_dct ,zzout);

initial
begin
    //reset = 0; clock = 0;
    #(`CYCLE/4)
    ;//reset = 1;
    #(`CYCLE/2)
    //reset = 0;
    bufaddr_in=0;
    j=0;
	k=0;
    enable_dct=0;//controlled by testbench (but it should be controlled by the output of Entropy.busy)
	enable_QT=0;
end

initial
begin     
  wait(enable==1)begin//#(`CYCLE/4*5)
    //@(posedge clock)
	for(i=0;i<1024;i=i+0) begin
      if(write==1)begin
		in_data<=cpu_in[23:0];
		j<=(controller.u_top_jpeg.data_valid)?j+1:0;
		//j<=j+1;
		bufaddr_in<=(controller.u_top_jpeg.data_valid)?j:0;
		//bufaddr_in<=j;
		//$display($time,"%b",controller.u_top_jpeg.data_valid);
		i=i+1;
		end
      if(i!=1023)
         #(`CYCLE);
    end
  end
  in_data<=0;
  
  for(j=0;j<1024*3;j=j+1)begin
  data_select<=j%3;
   for(k=j*8;k<(32*8+j*8);k=k+32)begin
    for(i=k;i<(k+8);i=i+1) begin
      bufaddr_out<=i;
	  enable_dct<=1;
	  //$display($time,"@@");
      //if(i!=64*8+k-64)
	  #(`CYCLE) ;//if(i==64*8+k-64)enable_QT=1;
    end
   //enable_QT=1;
   @(dct_valid)enable_QT=1;
   
   #(`CYCLE*8) enable_dct<=0;
   
   //#(`CYCLE*16) k=8;//xx
   #(`CYCLE*8) 
   enable_QT=0;
  end 
 end

 
end
/*
always@(posedge ZZ_valid or posedge reset)begin
	out_ready<=(zz_count>24000)?1:0;
	if(reset)
		zz_count<=0;
	else
		zz_count<=zz_count+1;
end*/

endmodule
