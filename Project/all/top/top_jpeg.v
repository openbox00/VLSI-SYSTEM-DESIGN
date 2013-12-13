//+FHDR
//author:Chen Chun-Yu
//2010.12.06 create this file
//2010.12.06 use top_buf2dct.v as base file
//-FHDR
`timescale 1ns/10ps
`define DCT_INOUT 12
`define QT_OUT 8
`define ZZ_OUT 8
//`define DCT_SIZE 12
`define PIXEL_SIZE 8
`define WIDTH 32
`define HEIGHT 32
`define TOTAL_SIZE `WIDTH*`HEIGHT
`define JPEG_OUT 32
//`define DCT_IN 96

module top_jpeg(clock,reset
                ,dct_valid,dct_ready,dct_cnt,QT_valid,ZZ_valid
                ,data_select,enable_dct,enable_QT,
   				    total_finish,
				    final_enable,
				    busy,
				    frame_count,
				    jpg_en,
				    jpg_out,
				    entropy_cycle,
				    co_cycle,
                   in_data,bufaddr_in,bufaddr_out,
                   dct_out0,dct_out1,dct_out2,dct_out3,dct_out4,dct_out5,dct_out6,dct_out7,
                   qt_out0,qt_out1,qt_out2,qt_out3,qt_out4,qt_out5,qt_out6,qt_out7,
                   zzout,jpegout);
    /*output[`DCT_IN-1:0] Y_out;
    output[`DCT_IN-1:0]Cb_out;
    output[`DCT_IN-1:0]Cr_out;*/
    output[`DCT_INOUT-1:0] dct_out0;
    output[`DCT_INOUT-1:0] dct_out1;
    output[`DCT_INOUT-1:0] dct_out2;
    output[`DCT_INOUT-1:0] dct_out3;
    output[`DCT_INOUT-1:0] dct_out4;
    output[`DCT_INOUT-1:0] dct_out5;
    output[`DCT_INOUT-1:0] dct_out6;
    output[`DCT_INOUT-1:0] dct_out7;
    output[`QT_OUT-1:0] qt_out0;
    output[`QT_OUT-1:0] qt_out1;
    output[`QT_OUT-1:0] qt_out2;
    output[`QT_OUT-1:0] qt_out3;
    output[`QT_OUT-1:0] qt_out4;
    output[`QT_OUT-1:0] qt_out5;
    output[`QT_OUT-1:0] qt_out6;
    output[`QT_OUT-1:0] qt_out7;
    output[`ZZ_OUT-1:0] zzout;
    output [`JPEG_OUT-1:0] jpegout;
    output [`JPEG_OUT-1:0] jpg_out;//??
    
    output dct_valid;//dct data is correct when dct_valid=1
    output dct_ready;//dct is ready to get input when dct_ready=1
    output [3:0] dct_cnt;
    output QT_valid;
    output ZZ_valid;
    output total_finish;
    output	final_enable;	
    output busy;	
    output [11:0] frame_count;

    output jpg_en;
    output [14:0] entropy_cycle;
    output [14:0] co_cycle;
    
    input clock;
    input reset;
    input [23:0] in_data;
    input [1:0] data_select;
    input enable_dct;
	input enable_QT;
    input [18:0]bufaddr_in;
    input [18:0]bufaddr_out;
    //input [31:0]i;
    
    wire nrst=~reset;
    wire [`PIXEL_SIZE*2-1:0] Y_in;
    wire [`PIXEL_SIZE*2-1:0]Cb_in;
    wire [`PIXEL_SIZE*2-1:0]Cr_in;
    
    wire [`DCT_INOUT*8-1:0] data_out;
  //  wire [`DCT_INOUT*8-1:0]Cb_out;
  //  wire [`DCT_INOUT*8-1:0]Cr_out;
    wire data_valid;//Y,Cb,Cr is correct when data_valid=1
    wire [`QT_OUT*2-2:0]quant_cycle; 
    /*
    reg [`DCT_INOUT-1:0] dct_in0;//[`DCT_SIZE-1:0];
    reg [`DCT_INOUT-1:0] dct_in1;
    reg [`DCT_INOUT-1:0] dct_in2;
    reg [`DCT_INOUT-1:0] dct_in3;
    reg [`DCT_INOUT-1:0] dct_in4;
    reg [`DCT_INOUT-1:0] dct_in5;
    reg [`DCT_INOUT-1:0] dct_in6;
    reg [`DCT_INOUT-1:0] dct_in7;*/
    //wire buffer_enable=1'b1;
    
    reg bufaddrout_valid;
    reg [1:0]current_state;
    reg [1:0]next_state;
    reg [2:0]test;
    
    integer i;
    
    rgb_ycbcr u_rgb_ycbcr(
       .clk(clock),
       .reset(reset),
       .in_data(in_data),
       .Y(Y_in),
       .Cb(Cb_in),
       .Cr(Cr_in),
       .enable(data_valid)
    );
    
    yuv_buffer u_yuv_buffer(
       .data_out(data_out),
       .clock(clock),
       .reset(reset),
       .data_select(data_select),
       .write_read(data_valid),
       .Y_in(Y_in),
       .Cb_in(Cb_in),
       .Cr_in(Cr_in),
       .addr_in(bufaddr_in),
       .addr_out(bufaddr_out)
       );
    
    dct_2d u_dct2d(
              .clk(clock), 
              .rst(reset), 
              .enable(enable_dct),
              .in0(data_out[`DCT_INOUT*8-1:`DCT_INOUT*7]),//dct_in0), 
              .in1(data_out[`DCT_INOUT*7-1:`DCT_INOUT*6]),//dct_in1), 
              .in2(data_out[`DCT_INOUT*6-1:`DCT_INOUT*5]),//dct_in2), 
              .in3(data_out[`DCT_INOUT*5-1:`DCT_INOUT*4]),//dct_in3), 
              .in4(data_out[`DCT_INOUT*4-1:`DCT_INOUT*3]),//dct_in4), 
              .in5(data_out[`DCT_INOUT*3-1:`DCT_INOUT*2]),//dct_in5), 
              .in6(data_out[`DCT_INOUT*2-1:`DCT_INOUT*1]),//dct_in6), 
              .in7(data_out[`DCT_INOUT*1-1:`DCT_INOUT*0]),//dct_in7),
              .out_en(dct_valid), 
              //.dct_ready(dct_ready),  
              .out0(dct_out0), 
              .out1(dct_out1), 
              .out2(dct_out2), 
              .out3(dct_out3), 
              .out4(dct_out4), 
              .out5(dct_out5), 
              .out6(dct_out6), 
              .out7(dct_out7)
              //.dct_cnt(dct_cnt)
       );
       
       Quantize u_Quantize(// input clock and reset
                     .clk(clock), 
                     .nrst(nrst), 

                     .enable_y( (~data_select[0])&(~data_select[1]) ),
                     .enable_cb(data_select[0]),
                     .enable_cr(data_select[1]), 
                    
                    // input quantization enable
                     .enable_quant(enable_QT), 
                    
                    // input dct counter (0~15)
                    //.counter(dct_cnt), 
                    
                    // input dct result (12-bit)
                     .input_01(dct_out0), 
                     .input_02(dct_out1), 
                     .input_03(dct_out2), 
                     .input_04(dct_out3),
                     .input_05(dct_out4), 
                     .input_06(dct_out5), 
                     .input_07(dct_out6), 
                     .input_08(dct_out7),                    
                    
                    // output zzscan enable
                     .enable_zzscan(QT_valid),////????  
        
                    // output quantization value (8-bit)
                     .output_01(qt_out0), 
                     .output_02(qt_out1), 
                     .output_03(qt_out2), 
                     .output_04(qt_out3),
                     .output_05(qt_out4), 
                     .output_06(qt_out5), 
                     .output_07(qt_out6), 
                     .output_08(qt_out7),
							.quant_cycle(quant_cycle) 
							);
    
    zzscan u_zzscan(//input!!! 
         .clk(clock), 
         .nrst(nrst),
         .in1(qt_out0),
         .in2(qt_out1),
         .in3(qt_out2),
         .in4(qt_out3),
         .in5(qt_out4),
         .in6(qt_out5),
         .in7(qt_out6),
         .in8(qt_out7),
         .valid(QT_valid),
         //output!!!
         .zzout(zzout),
         .vlcden_i(ZZ_valid)
			);
			
	Entropy u_Entropy(//input
             .clk(clock), 
             .nrst(nrst),
             .entropy_in(zzout),
             .entropy_ena(ZZ_valid),
             .lumenb_in((~data_select[0])&(~data_select[1])),
             .chromenb_uin(data_select[0]),
             .chromenb_vin(data_select[1]),
             //output
				 .JPEG_OUT(jpegout),
				 .total_finish(total_finish),
				 .final_enable(final_enable),
				 .busy(busy),
				 .frame_count(frame_count),
				 .jpg_en(jpg_en),
				 .jpg_out(jpg_out),
				 .entropy_cycle(entropy_cycle),
				 .co_cycle(co_cycle)
             );
endmodule
