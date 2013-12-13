`timescale 1ns/10ps
`define INPUTSIZE4 8
`define DCDATASIZE 10
`define ACDATASIZE 10
`define DATASIZE	 10
`define OUTPUTSIZE4 10
module vlcctl(//input                                                                                                           
               clk,nrst,
               dqin,den,                                                                                                            
               lumenb_in,chromenb_uin,chromenb_vin, 
               
              //output
               lumenb,chromenb_u,chromenb_v,
               idle,dc,eob,dcsize,
               vlcdeno,
               unsg_dout,
               sign,
					frame_end,
               length_bit,
               lrun,lsize,
               crun,csize,
					frame_count,
					entropy_cycle,
					co_cycle			 );                                                                                             
                                                                    
input        clk,nrst;     
input  [`INPUTSIZE4-1:0] dqin;                              
input        den;              
input        lumenb_in,chromenb_uin,chromenb_vin;           

output       idle;
output       dc,eob;
output [3:0] dcsize;
output       vlcdeno;              
output [`OUTPUTSIZE4-1:0] unsg_dout;   //for appended code word 
output       sign;
output [3:0] lrun,lsize; 
output [3:0] crun,csize;
output [4:0] length_bit;
output lumenb;
output chromenb_u;
output chromenb_v;
output frame_end;
output [11:0] frame_count;
output [14:0] entropy_cycle;
output [14:0] co_cycle;

reg [7:0]  run;                                   

wire [3:0] size;
reg  [`INPUTSIZE4-1:0] prev_ldc;
reg  [`INPUTSIZE4-1:0] prev_cudc;
reg  [`INPUTSIZE4-1:0] prev_cvdc;
reg  		  den_d;

reg [6:0]  end_count;

reg 	     lumenb_reg;
reg 	     chromenb_ureg;
reg 		  chromenb_vreg;

reg 		  frame_end;

reg [11:0] frame_count;
reg [14:0] entropy_cycle;
reg [6:0]  vlc_cycle;
reg [14:0] co_cycle;

//reg  lumenb_d,chromenb_d;

wire zero= ~dc & den & (dqin==0);  
wire zero15=(run==15 & zero);
wire idle=dc?0:(zero& ~zero15);

//for successively 15 zero add a codeword!

always @(posedge clk or negedge nrst)
begin
  if (~nrst) vlc_cycle <= 0; 
  else if(den) vlc_cycle <= vlc_cycle + 1;
  else if(eob) vlc_cycle <= 0;
end


always @(posedge clk or negedge nrst)
begin
  if (~nrst) begin 
		entropy_cycle <= 0; 
		co_cycle <= 0;
  end
  else if(chromenb_uin & eob) 
			 entropy_cycle <= entropy_cycle + vlc_cycle;
  else if(vlc_cycle < 9 & eob) begin 
			 co_cycle <= co_cycle + vlc_cycle;
			 entropy_cycle <= entropy_cycle + vlc_cycle;
  end
  else if(vlc_cycle > 9 & eob) begin 
			 entropy_cycle <= entropy_cycle + vlc_cycle;
			 co_cycle <= co_cycle + 8;
  end			 
end

always @(posedge clk or negedge nrst)
begin
  if (~nrst)             run<=0; 
  else if (~zero|zero15)  run<=0;
       else if ( zero)     run<=run+1;
end

always @(posedge clk or negedge nrst)
begin
  if (~nrst)     end_count<=0; 
  else if (den) 	end_count <= end_count+1;
		 else 		  end_count <= 0;
end

always @(posedge clk or negedge nrst)
begin
  if (~nrst) begin
		 den_d  <=0;
       lumenb_reg<=0;
       chromenb_ureg<=0;
       chromenb_vreg<=0;           
  end else begin                 
		 den_d  <=den; 
       lumenb_reg<=lumenb;   
       chromenb_ureg<=chromenb_u;
       chromenb_vreg<=chromenb_v;
  end
end

wire vlcdeno= den ; 
wire dc     = den & ~den_d;
wire eob =~den & den_d & (end_count!=64);  

wire lumenb=(den | eob)?lumenb_reg:lumenb_in;
wire chromenb_u=(den | eob)?chromenb_ureg:chromenb_uin;
wire chromenb_v=(den | eob)?chromenb_vreg:chromenb_vin;

always @(posedge clk or negedge nrst)
begin
  if (~nrst)
		 frame_end <= 0;           
  else if(frame_count == 3072 & den == 0)
		 frame_end <= 1;
end

always @(posedge clk or negedge nrst)
begin
  if (~nrst)
		 frame_count <=0;           
  else if(dc)
		 frame_count <= frame_count + 1;
end

always @(posedge clk or negedge nrst)
begin
 if (~nrst) begin              
                prev_ldc<=0;
                prev_cudc<=0;
                prev_cvdc<=0;
 end else if (dc & lumenb) 
                prev_ldc <=dqin;
 else if (dc & chromenb_u)
                prev_cudc<=dqin;
 else if (dc & chromenb_v)
                prev_cvdc<=dqin;    
end

wire lumenb_cnt=dc& lumenb;
wire chromenb_ucnt = dc & chromenb_u;
wire chromenb_vcnt = dc & chromenb_v; 
wire [`DCDATASIZE-1:0] ldcdiff= lumenb_cnt?({{2{dqin[7]}},dqin} - {{2{prev_ldc[7]}},prev_ldc}):0;
wire [`DCDATASIZE-1:0] cudcdiff=chromenb_ucnt?({{2{dqin[7]}},dqin} - {{2{prev_cudc[7]}},prev_cudc}):0;
wire [`DCDATASIZE-1:0] cvdcdiff=chromenb_vcnt?({{2{dqin[7]}},dqin} - {{2{prev_cvdc[7]}},prev_cvdc}):0;
wire [`DCDATASIZE-1:0] unsigned_ldcdiff=ldcdiff[9]?(~ldcdiff+1):ldcdiff;
wire [`DCDATASIZE-1:0] unsigned_cudcdiff=cudcdiff[9]?(~cudcdiff+1):cudcdiff;
wire [`DCDATASIZE-1:0] unsigned_cvdcdiff=cvdcdiff[9]?(~cvdcdiff+1):cvdcdiff;

wire [`ACDATASIZE-1:0] unsigned_ac=dqin[`INPUTSIZE4-1]?(~{{2{dqin[7]}},dqin}+1):{{2{dqin[7]}},dqin};    
                       
reg [`DATASIZE-1:0] unsigned_din;

always@(dc or lumenb or chromenb_u or chromenb_v or unsigned_ldcdiff or unsigned_cvdcdiff or unsigned_cudcdiff or unsigned_ac)
begin
      if(dc)
      begin
      case({lumenb,chromenb_u,chromenb_v})
      3'b100:
              unsigned_din=unsigned_ldcdiff;
      3'b010:
              unsigned_din=unsigned_cudcdiff;
      3'b001:
              unsigned_din=unsigned_cvdcdiff;
      default:
              unsigned_din=0;
      endcase
      end
      else
              unsigned_din=unsigned_ac;   
end
 
wire sign  = dc?(lumenb? ldcdiff[`DCDATASIZE-1]:
					  chromenb_u? cudcdiff[`DCDATASIZE-1]: 
					  chromenb_v? cvdcdiff[`DCDATASIZE-1]:0):dqin[`INPUTSIZE4-1];

// need second unsigned part
wire [`OUTPUTSIZE4-1:0] unsg_dout=sign?~unsigned_din:unsigned_din;//dc? dc_append:ac_appended;                       

sizetable sizetable(
          //input
            .din(unsigned_din),
          //output
            .size(size)); 
            
wire [3:0] dcsize=dc?size:0;          
wire [3:0] lsize=(dc | eob)?0:zero15?(lumenb?4'b0000:0):(lumenb?size:0);
wire [3:0] csize=(dc | eob)?0:zero15?((chromenb_u | chromenb_v) ?4'b0000:0):((chromenb_u | chromenb_v) ?size:0);
wire [3:0] lrun =(dc | eob)?0:zero15?(lumenb?4'b1111:4'b0):(lumenb?run[3:0]:4'b0);
wire [3:0] crun =(dc | eob)?0:zero15?((chromenb_u | chromenb_v)?4'b1111:4'b0):((chromenb_u | chromenb_v)?run[3:0]:4'b0);
wire [4:0] length_bit={1'b0,size}-1;                        
                                                                                                                                
endmodule                                                                                                                       
