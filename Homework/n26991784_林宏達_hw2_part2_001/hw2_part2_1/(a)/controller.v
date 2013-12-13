`timescale 1ns/10ps

module CONTROLLER(clk, rst_n, opcode, sub_op, fetch_ena, branch_ena,reg_rw, 
				 funct, mem_ena, mem_rw, sel_alu_in1, sel_alu_in2, sel_wb, 
				 sel_ext, sel_pc, ls_w_mode, sign_ena, alu_ena, reg_alu_ena, alu_result);
input clk, rst_n;
input [5:0] opcode;
input [4:0] sub_op;
input [31:0] alu_result;

output reg [1:0] sel_alu_in1;
output reg [1:0] sel_alu_in2;
output reg [1:0] sel_pc;
output reg fetch_ena, reg_alu_ena, reg_rw, mem_ena, mem_rw, sign_ena, alu_ena, branch_ena;
output reg [1:0] sel_wb;
output reg [2:0] sel_ext;
output reg [3:0] funct;
output reg ls_w_mode;

wire [31:0] alu_result;
reg [3:0] present_state, next_state;

`define ADD 	5'b00000
`define SUB 	5'b00001
`define AND 	5'b00010
`define OR 		5'b00100
`define XOR 	5'b00011
`define SRLI 	5'b01001
`define SLLI 	5'b01000
`define ROTRI 	5'b01011

`define STD 	6'b100000
`define ADDI 	6'b101000
`define ORI 	6'b101100
`define XORI 	6'b101011
`define LWI 	6'b000010
`define SWI 	6'b001010

`define MOVI 	6'b100010

`define LSW		6'b011100

`define BEQ		6'b100110
`define J		6'b100100

parameter 	S0 = 4'd0,
			S1 = 4'd1,
			S2 = 4'd2,
			S3 = 4'd3,
			S4 = 4'd4,
			S5 = 4'd5,
			S6 = 4'd6,
			S7 = 4'd7,
			S8 = 4'd8,
			S9 = 4'd9,
			S10 = 4'd10,
			S11 = 4'd11;
			
always@(posedge clk, negedge rst_n)			
begin
	if(!rst_n) present_state <= S0;
	else present_state <= next_state;
end



always@(present_state)
begin
	case(present_state)
		S0: next_state = S1;
		S1: case(opcode)
			`LWI,`SWI,`LSW	:	next_state =   S2;
			`BEQ			:	next_state =   S8;
			`J				:	next_state =   S9;
			default			:	next_state =   S6;
			endcase
		S2: case(opcode)
			`LSW			:	case(sub_op)
							5'b00010	:	next_state =   S3;
							5'b01010	:	next_state =   S5;
							default		:	next_state =   S0;
								endcase
			`LWI			:	next_state =   S3;
			`SWI			:	next_state =   S5;
			default		:	next_state =   S0;
			endcase
		S3: next_state = S4;
		S4: next_state = S0;
		S5:	next_state = S0;
		S6:	next_state = S7;
		S7:	next_state = S0;
		S8:	next_state = S0;
		S9:	next_state = S0;
		//S10:next_state = S0;
		//S11:next_state = S0;
		default: next_state = S0;
	endcase
end



always@(present_state, opcode, sub_op, alu_result)
begin
	case(present_state)
		S0:	begin
			branch_ena = 0;
			fetch_ena = 1;
			reg_rw = 0;
			funct = 4'd1;
			mem_ena = 0;
			mem_rw = 0;
			sel_alu_in1 = 2'd0;//choose pc
			sel_alu_in2 = 2'd1;//+1
			sel_wb = 2'd2;
			ls_w_mode = 0;
			sel_ext = 3'd0;
			sign_ena = 0;
			alu_ena = 1;
			reg_alu_ena = 1;
			sel_pc=2'd1;
			
		end
		
		S1:	begin
			branch_ena = 0;
			fetch_ena = 0;
			reg_rw = 0;
			funct = 4'd1;
			mem_ena = 0;
			mem_rw = 0;
			sel_alu_in1 = 2'd0;
			sel_alu_in2 = 2'd2;
			sel_wb = 2'd0;
			ls_w_mode = 0;
			sel_ext = 3'd1;
			sign_ena = 1;
			alu_ena = 1;
			reg_alu_ena = 1;
			sel_pc=2'd1;
		end
		
		S8:	begin
			branch_ena = 1;
			fetch_ena = 0;
			reg_rw = 0;
			funct = 4'd2;
			mem_ena = 0;
			mem_rw = 0;
			sel_alu_in1 = 2'd1;//read_data1
			sel_alu_in2 = 2'd3;//Rt
			ls_w_mode = 0;
			sel_ext = 3'd0;
			sign_ena = 0;
			alu_ena = 1;
			sel_wb = 2'd0;
			reg_alu_ena = 0;
			if(|alu_result)
			sel_pc=2'd2;//pc+4
			else
			sel_pc=2'd0;//beq
		end
		
	/*	S10:	begin
			fetch_ena = 0;
			reg_rw = 0;
			funct = 4'd1;
			mem_ena = 0;
			mem_rw = 0;
			sel_alu_in1 = 2'd1;//read_data1
			sel_alu_in2 = 2'd0;//Rt
			ls_w_mode = 0;
			sel_ext = 3'd0;
			sign_ena = 0;
			alu_ena = 0;
			sel_wb = 2'd0;
			reg_alu_ena = 1;
			if(|alu_result)
			sel_pc=2'd1;//pc+4
			else
			sel_pc=2'd0;//beq
		end*/
		
		S9:	begin
			branch_ena = 1;
			fetch_ena = 0;
			reg_rw = 0;
			funct = 3'd1;
			mem_ena = 0;
			mem_rw = 0;
			sel_alu_in1 = 2'd0;//pc
			sel_alu_in2 = 2'd2;//imm
			ls_w_mode = 0;
			sel_ext = 3'd4;
			sign_ena = 1;
			alu_ena = 1;
			sel_wb = 2'd0;
			reg_alu_ena = 1;
			sel_pc=2'd0;//j
			end
			
		/*S11:	begin
			fetch_ena = 0;
			reg_rw = 0;
			funct = 3'd1;
			mem_ena = 0;
			mem_rw = 0;
			sel_alu_in1 = 2'd0;//pc
			sel_alu_in2 = 2'd2;//imm
			ls_w_mode = 0;
			sel_ext = 3'd4;
			sign_ena = 1;
			alu_ena = 1;
			sel_wb = 2'd0;
			reg_alu_ena = 1;
			sel_pc=2'd0;//j
			end*/
		
		S6:	begin
			branch_ena = 0;
			fetch_ena = 0;
			reg_rw = 0;
			mem_ena = 0;
			mem_rw = 0;
			sel_wb = 0;
			alu_ena = 1;
			reg_alu_ena = 1;
			sel_pc=2'd 1;
			ls_w_mode =0;
			case(opcode)
			`STD	:	begin
						sel_alu_in1 = 2'd1;
						sel_ext = 3'd0;
						sign_ena = 0;
						if (sub_op == `SRLI	||	sub_op == `SLLI	||	sub_op == `ROTRI)
						sel_alu_in2 = 2'd2;
						else sel_alu_in2 = 2'd0;
						case(sub_op)
						`ADD: 	funct = 4'd1;
						`SUB: 	funct = 4'd2;
						`AND: 	funct = 4'd3;
						`OR: 	funct = 4'd4;
						`XOR: 	funct = 4'd5;
						`SRLI: 	funct = 4'd6;
						`SLLI: 	funct = 4'd7;
						`ROTRI: funct = 4'd8;
						default:funct = 4'd0;
						endcase
						end
			`ADDI	:	begin
						sign_ena = 1;
						sel_alu_in1 = 2'd1;
						sel_ext = 3'd2;
						sel_alu_in2 = 2'd2;
						funct = 4'd1;
						end
			`ORI	:	begin
						sign_ena = 0;
						sign_ena = 0;
						sel_alu_in1 = 2'd1;
						sel_ext = 3'd2;
						sel_alu_in2 = 2'd2;
						funct = 4'd4;
						end		
			`XORI	:	begin
						sign_ena = 0;
						sel_alu_in1 = 2'd1;
						sel_ext = 3'd2;
						sel_alu_in2 = 2'd2;
						funct = 4'd5;
						end	
			`MOVI	:	begin
						sign_ena = 1;
						sel_alu_in1 = 2'd2;
						sel_ext = 3'd3;
						sel_alu_in2 = 2'd2;
						funct = 4'd1;
						end	
			
			default	:	begin
						sign_ena = 0;
						sel_alu_in1 = 2'd1;
						sel_ext = 3'd0;
						sel_alu_in2 = 2'd0;
						funct = 4'd0;
						end	
			endcase
			end
	
		S7:	begin
			branch_ena = 0;
			fetch_ena = 0;
			reg_rw = 1;
			funct = 4'd1;
			mem_ena = 0;
			mem_rw = 0;
			sel_alu_in1 = 2'd1;//d
			sel_alu_in2 = 2'd0;//data1
			ls_w_mode = 0;
			sel_ext = 3'd0;
			sign_ena = 0;
			alu_ena = 0;
			sel_wb = 2'd2;
			reg_alu_ena = 0;
			sel_pc=2'd1;//
			end		
	
		S5:	begin
			branch_ena = 0;
			sel_pc=2'd1;//PC
			fetch_ena = 0;
			funct = 4'd1;
			mem_ena = 1;
			mem_rw = 1;
			alu_ena = 0;
			reg_alu_ena = 0;
			sel_alu_in1 = 2'd1;
			sel_wb = 2'd0;
			reg_rw = 0;
			sel_alu_in2 = 2'd0;//data1
			ls_w_mode = 0;
			sel_ext = 3'd0;
			sign_ena = 0;
			end
			
		S2:	begin
			branch_ena = 0;
			fetch_ena = 0;
			reg_rw = 0;
			funct = 4'd10;
			mem_ena = 0;
			mem_rw = 0;
			sel_wb = 2'd0;
			sign_ena = 1;
			reg_alu_ena = 1;
			sel_pc=2'd 1;
			alu_ena = 1;
			sel_alu_in1 = 2'd1;
			case(opcode)
			`LSW	:	begin
						ls_w_mode = 1;
						sel_alu_in2 = 2'd0;//read_data2
						sel_ext = 3'd0;
						end
			`LWI,
			`SWI	:	begin
						ls_w_mode = 0;
						sel_alu_in2 = 2'd2;//imm
						sel_ext = 3'd2;
						end
			endcase
			end
	
	
		S3:	begin
			branch_ena = 0;
			sel_pc=2'd1;//PC
			reg_rw = 0;
			fetch_ena = 0;
			funct = 4'd1;
			mem_ena = 1;
			mem_rw = 0;
			sel_wb = 2'd1;
			alu_ena = 0;
			reg_alu_ena = 0;
			sel_alu_in1 = 2'd1;
			sel_alu_in2 = 2'd0;
			ls_w_mode = 0;
			sel_ext = 3'd0;
			sign_ena = 0;
			end
			
		S4:	begin
			branch_ena = 0;
			sel_pc=2'd1;//PC
			reg_rw = 1;
			fetch_ena = 0;
			funct = 4'd1;
			mem_ena = 0;
			mem_rw = 0;
			sel_wb = 2'd1;
			alu_ena = 0;
			reg_alu_ena = 0;
			sel_alu_in1 = 2'd1;
			sel_alu_in2 = 2'd0;
			ls_w_mode = 0;
			sel_ext = 3'd0;
			sign_ena = 0;
			end	

endcase
end
endmodule
