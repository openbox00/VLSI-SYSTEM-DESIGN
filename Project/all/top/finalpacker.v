`timescale 1ns/10ps
`define OUTPUTSIZE2 8
`define INPUTSIZE2 32
module finalpacker(
				//input
				jpg_en,
				jpg_out,
				non_out,
				clk,
				nrst,
				//nrst,
				non_length,
				frame_end,
				//output
				JPEG_OUT,
			//	pack_length,
				final_enable,
				total_finish
				);
input [`INPUTSIZE2-1:0]jpg_out;
input 		jpg_en;
input [`INPUTSIZE2-1:0]non_out;
input [5:0] non_length;
input 		clk,nrst,frame_end;
		
output [`INPUTSIZE2-1:0]JPEG_OUT;
output 		final_enable;
output 		total_finish;

reg   [3*`INPUTSIZE2-1:0]buf_tmp;
reg   [3*`INPUTSIZE2-1:0]temp;
reg  			final_enable;
reg  [6:0]  length;
reg  [6:0]  length_tmp;
reg  [31:0] JPEG_OUT;
//reg  [3:0]  total_flag;
parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100,S5=3'b101,S6=3'b110;
reg [2:0]   STATE,NEXTSTATE;
reg 			total_finish;
reg 			final_finish;
//reg [1:0]	end_write;
reg			final_en;
reg [31:0]  final_out;

reg [3*`INPUTSIZE2-1:0] buffer;
reg [6:0]  total_length; 
reg [31:0] out_temp;

always@(posedge clk or negedge nrst)
begin
   	if(~nrst)
			out_temp <= 0;
		else if(jpg_en)
			out_temp <= jpg_out;
		else if(frame_end)
			out_temp <= non_out>>(6'd32-non_length);
		else 
			out_temp <= 0;
end
								
always@(posedge clk or negedge nrst)
begin
   	if(~nrst)
			STATE<=S0;
		else
			STATE<=NEXTSTATE;
end
	
always@(posedge clk or negedge nrst)
begin	
	if(~nrst) begin
			final_enable<=0;
			length_tmp<=0;
			buf_tmp <= 0;
			JPEG_OUT <= 0;
			total_finish <= 0;
	end
	else begin
			buf_tmp <= buffer;
			length_tmp<= total_length;
			JPEG_OUT<=final_out;
			final_enable<=final_en;
			total_finish <= final_finish;
	end
end		
	
always@(STATE or frame_end or jpg_en)
begin
		case(STATE)	
		S0:
		begin
		if(jpg_en)
			NEXTSTATE=S1;
		else
			NEXTSTATE=S0;
		end
		S1:
		begin
		if(~frame_end && jpg_en)
			NEXTSTATE=S1;
		else if(frame_end && ~jpg_en)
			NEXTSTATE=S3;
		else
			NEXTSTATE=S2;
		end	
		S2:
		begin
		if(frame_end && ~jpg_en)
			NEXTSTATE=S3;
		else if(~jpg_en)
			NEXTSTATE=S2;
		else
			NEXTSTATE=S1;
		end
		S3:
		begin
			NEXTSTATE=S4;
		end
		S4:
		begin 
			NEXTSTATE=S5;
		end
		S5:
		begin
			NEXTSTATE=S6;
		end
		S6:
		begin
			NEXTSTATE=S6;
		end
		default: NEXTSTATE=S0;
		endcase		
end

reg 			flag1; 
reg 		   flag2; 
reg 		   flag3; 
reg 		   flag4; 

always@(STATE or length_tmp or buf_tmp)
begin
	case(STATE)
		S0:
		begin
				final_finish=1'b0;
				length=7'b0;
				temp=64'b0;
				total_length = 0;
				buffer = 0;
				final_out = 0;
				final_en = 0;
				flag1=0;
				flag2=0;
				flag3=0;
				flag4=0;
		end
		S1:
		begin
			if(out_temp[31:24]==8'hFF)
					flag1 = 1;
			else
					flag1 = 0;
			if(out_temp[23:16]==8'hFF)
					flag2 = 1;
			else
					flag2 = 0;
			if(out_temp[15:8]==8'hFF)
					flag3 = 1;
			else
					flag3 = 0;
			if(out_temp[7:0]==8'hFF)
					flag4 = 1;
			else
					flag4 = 0;
			case({flag1,flag2,flag3,flag4})
					4'b0000:
					begin
						length=7'd32;
						temp=out_temp;
					end
					4'b0001:
					begin
						length=7'd40;
						temp={24'h0,out_temp,8'h00};
					end
					4'b0010:
					begin
						length=7'd40;
						temp={24'h0,out_temp[31:8],8'h00,out_temp[7:0]};
					end
					4'b0011:
					begin
						length=7'd48;
						temp={16'h0,out_temp[31:8],8'h00,out_temp[7:0],8'h00};
					end
					4'b0100:
					begin
						length=7'd40;
						temp={24'h0,out_temp[31:16],8'h00,out_temp[15:0]};
					end
					4'b0101:
					begin
						length=7'd48;
						temp={16'h0,out_temp[31:16],8'h00,out_temp[15:0],8'h00};
					end
					4'b0110:
					begin
						length=7'd48;
						temp={16'h0,out_temp[31:16],8'h00,out_temp[15:8],8'h00,out_temp[7:0]};
					end
					4'b0111:
					begin
						length=7'd56;
						temp={8'h0,out_temp[31:16],8'h00,out_temp[15:8],8'h00,out_temp[7:0],8'h00};
					end
					4'b1000:
					begin
						length=7'd40;
						temp={24'h0,out_temp[31:24],8'h00,out_temp[23:0]};
					end
					4'b1001:
					begin
						length=7'd48;
						temp={16'h0,out_temp[31:24],8'h00,out_temp[23:0],8'h00};
					end
					4'b1010:
					begin
						length=7'd48;
						temp={16'h0,out_temp[31:24],8'h00,out_temp[23:8],8'h00,out_temp[7:0]};
					end
					4'b1011:
					begin
						length=7'd56;
						temp={8'h0,out_temp[31:24],8'h00,out_temp[23:8],8'h00,out_temp[7:0],8'h00};
					end
					4'b1100:
					begin
						length=7'd48;
						temp={16'h0,out_temp[31:24],8'h00,out_temp[23:16],8'h00,out_temp[15:0]};
					end
					4'b1101:
					begin
						length=7'd56;
						temp={8'h0,out_temp[31:24],8'h00,out_temp[23:16],8'h00,out_temp[15:0],8'h00};
					end
					4'b1110:
					begin
						length=7'd56;
						temp={8'h0,out_temp[31:24],8'h00,out_temp[23:16],8'h00,out_temp[15:8],8'h00,out_temp[7:0]};
					end
					4'b1111:
					begin
						length=7'd64;
						temp={out_temp[31:24],8'h00,out_temp[23:16],8'h00,out_temp[15:8],8'h00,out_temp[7:0],8'h00};
					end
					default: begin
						length = 7'd0;
						temp = 64'b0;
					end
				endcase
			buffer = ( buf_tmp << length ) | {32'b0,temp};
			final_out = ( (buf_tmp << length ) | {32'b0,temp}) >> (length + length_tmp - 32);
			final_en = 1;
			total_length = length + length_tmp - 32;
			final_finish=1'b0;
		end
		S2:
		begin
			if(length_tmp > 31) begin
				total_length = length_tmp - 32;
				buffer = buf_tmp;
				final_out = buf_tmp >> (length_tmp - 32);
				final_en = 1;
			end else begin
				total_length = length_tmp;
				buffer = buf_tmp;
				final_out = 0;
				final_en = 0;
			end
			temp = 0;
			length = 0;
			final_finish=1'b0;
			flag1=0;
			flag2=0;
			flag3=0;
			flag4=0;
		end
		S3:
		begin
		   if(out_temp[31:24]==8'hFF)
					flag1 = 1;
			else
					flag1 = 0;
			if(out_temp[23:16]==8'hFF)
					flag2 = 1;
			else
					flag2 = 0;
			if(out_temp[15:8]==8'hFF)
					flag3 = 1;
			else
					flag3 = 0;
			if(out_temp[7:0]==8'hFF)
					flag4 = 1;
			else
					flag4 = 0;
			case({flag1,flag2,flag3,flag4})
					4'b0000:
					begin
						length=7'd0;
						temp=out_temp;
					end
					4'b0001:
					begin
						length=7'd8;
						temp={24'h0,out_temp,8'h00};
					end
					4'b0010:
					begin
						length=7'd8;
						temp={24'h0,out_temp[31:8],8'h00,out_temp[7:0]};
					end
					4'b0011:
					begin
						length=7'd16;
						temp={16'h0,out_temp[31:8],8'h00,out_temp[7:0],8'h00};
					end
					4'b0100:
					begin
						length=7'd8;
						temp={24'h0,out_temp[31:16],8'h00,out_temp[15:0]};
					end
					4'b0101:
					begin
						length=7'd16;
						temp={16'h0,out_temp[31:16],8'h00,out_temp[15:0],8'h00};
					end
					4'b0110:
					begin
						length=7'd16;
						temp={16'h0,out_temp[31:16],8'h00,out_temp[15:8],8'h00,out_temp[7:0]};
					end
					4'b0111:
					begin
						length=7'd24;
						temp={8'h0,out_temp[31:16],8'h00,out_temp[15:8],8'h00,out_temp[7:0],8'h00};
					end
					4'b1000:
					begin
						length=7'd8;
						temp={24'h0,out_temp[31:24],8'h00,out_temp[23:0]};
					end
					4'b1001:
					begin
						length=7'd16;
						temp={16'h0,out_temp[31:24],8'h00,out_temp[23:0],8'h00};
					end
					4'b1010:
					begin
						length=7'd16;
						temp={16'h0,out_temp[31:24],8'h00,out_temp[23:8],8'h00,out_temp[7:0]};
					end
					4'b1011:
					begin
						length=7'd24;
						temp={8'h0,out_temp[31:24],8'h00,out_temp[23:8],8'h00,out_temp[7:0],8'h00};
					end
					4'b1100:
					begin
						length=7'd16;
						temp={16'h0,out_temp[31:24],8'h00,out_temp[23:16],8'h00,out_temp[15:0]};
					end
					4'b1101:
					begin
						length=7'd24;
						temp={8'h0,out_temp[31:24],8'h00,out_temp[23:16],8'h00,out_temp[15:0],8'h00};
					end
					4'b1110:
					begin
						length=7'd24;
						temp={8'h0,out_temp[31:24],8'h00,out_temp[23:16],8'h00,out_temp[15:8],8'h00,out_temp[7:0]};
					end
					4'b1111:
					begin
						length=7'd32;
						temp={out_temp[31:24],8'h00,out_temp[23:16],8'h00,out_temp[15:8],8'h00,out_temp[7:0],8'h00};
					end
					default: begin
						length = 7'd0;
						temp = 64'b0;
					end
				endcase
				
			if( ( length_tmp + non_length + length) > 31 ) begin
				total_length = length_tmp + non_length + length - 32;
				buffer = ( buf_tmp << (non_length + length) | temp);
				final_out = buffer >> length_tmp + non_length +length - 32;
				final_en = 1;
			end else begin
				total_length = length_tmp + non_length + length;
				buffer = ( buf_tmp << (non_length + length) | temp);
				final_out = 0;
				final_en = 0;
			end
			final_finish=1'b0;
		end
		S4:
		begin
			final_out = buf_tmp << (32 - length_tmp); 
			final_en = 1;
			buffer = 0;
			total_length = 0;
			temp = 0;
			final_finish=1'b0;
			flag1=0;
			flag2=0;
			flag3=0;
			flag4=0;
		end
		S5: 
		begin
			final_finish=1'b1;
			length=7'b0;
			temp=64'b0;
			total_length = 0;
			buffer = 0;
			final_out = 0;
			final_en = 0;
			flag1=0;
			flag2=0;
			flag3=0;
			flag4=0;
		end	
		S6: 
		begin
			final_finish=1'b0;
			length=7'b0;
			temp=64'b0;
			total_length = 0;
			buffer = 0;
			final_out = 0;
			final_en = 0;
			flag1=0;
			flag2=0;
			flag3=0;
			flag4=0;
		end	
		default: 
		begin
			final_finish=1'b0;
			length=7'b0;
			temp=64'b0;
			total_length = 0;
			buffer = 0;
			final_out = 0;
			final_en = 0;
			flag1=0;
			flag2=0;
			flag3=0;
			flag4=0;
		end	
	endcase
end
endmodule