`timescale 1ns/10ps

`define ADD 	5'b00000
`define SUB 	5'b00001
`define AND 	5'b00010
`define OR 		5'b00100
`define XOR 	5'b00011
`define SRLI 	5'b01001
`define SLLI 	5'b01000
`define ROTRI 	5'b01011
`define SLT		5'b00111

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
/////////////////////////////////////////////
`define SLTSI	6'b101111
`define BEQN	6'b100111
`define SUBRI	6'b101001
`define	MUL		6'b100001
`define	RET		6'b100101
//////////////////////////////////////////////
`define	BEQZ	4'b0010
`define	BNEZ	4'b0011

module CONTROLLER(reg_ena, funct, ls_w_mode, sign_ena 
					, sel_in2, ena_data, data_rw, sel_wb, reg_rw, sel, opcode, subopcode, read_data1, read_data2
					, clk, rst, sel_alu, branch_ena, Jump_ena, Ret_ena, beq_typ, bnez_ena);

input clk;			
input rst;
input [31:0] read_data1;
input [31:0] read_data2;
input [5:0] opcode;
input [4:0] subopcode;
input [3:0]	beq_typ;

output reg sel_alu;
output reg	[3:0] funct;
output reg	reg_ena;
output reg	ls_w_mode;
output reg	sel_in2;
output reg	ena_data;
output reg	data_rw;
output reg	sel_wb;
output reg	reg_rw;
output reg	sign_ena;


output reg	[3:0] sel;


output reg branch_ena;
output reg Jump_ena;
output reg Ret_ena;	
output reg bnez_ena;


always @ (opcode or subopcode)
begin
	reg_ena = 1;
	case(opcode)
	`STD	:	begin
				ls_w_mode = 0;
				branch_ena = 0;
				Jump_ena = 0;
					if (subopcode == `SRLI	||	subopcode == `SLLI	||	subopcode == `ROTRI)
					sel_in2 = 1;
					else sel_in2 = 0;
				ena_data = 0;
				data_rw =0;
				sel_wb = 1;
				reg_rw = 1;
				sign_ena = 0;
				sel_alu = 0;
					case(subopcode)
						`ADD: 	funct = 4'd1;
						`SUB: 	funct = 4'd2;
						`AND: 	funct = 4'd3;
						`OR: 	funct = 4'd4;
						`XOR: 	funct = 4'd5;
						`SRLI: 	funct = 4'd6;
						`SLLI: 	funct = 4'd7;
						`ROTRI: funct = 4'd8;
						`SLT:	funct = 4'd10;
						default:funct = 4'd0;
					endcase
				sel = 4'd0;
				Ret_ena = 0;
				bnez_ena = 0;
				end
					
	`ADDI	:	begin
				ls_w_mode = 0;
				sel_in2 = 1;
				ena_data = 0;
				data_rw =0;
				sel_wb = 1;
				reg_rw = 1;
				sign_ena = 1;
				funct = 4'd1;
				sel = 4'd2;
				sel_alu = 0;
				branch_ena = 0;
				Jump_ena = 0;
				Ret_ena = 0;
				bnez_ena = 0;
				end
			
	`ORI	:	begin
				ls_w_mode = 0;
				sel_in2 = 1;
				ena_data = 0;
				data_rw =0;
				sel_wb = 1;
				reg_rw = 1;
				sign_ena = 0;
				funct = 4'd4;
				sel = 4'd2;
				sel_alu = 0;
				branch_ena = 0;
				Jump_ena = 0;
				Ret_ena = 0;
				bnez_ena = 0;
				end		
				
	`XORI	:	begin
				ls_w_mode = 0;
				sel_in2 = 1;
				ena_data = 0;
				data_rw =0;
				sel_wb = 1;
				reg_rw = 1;
				sign_ena = 0;
				funct = 4'd5;
				sel = 4'd2;
				sel_alu = 0;
				branch_ena = 0;
				Jump_ena = 0;
				Ret_ena = 0;
				bnez_ena = 0;
				end	
				
	`MOVI	:	begin
				ls_w_mode = 0;
				sel_in2 = 0;
				ena_data = 0;
				data_rw = 0;
				sel_wb = 1;
				reg_rw = 1;
				sign_ena = 1;
				funct = 4'd0;
				sel = 4'd3;
				sel_alu = 1;
				branch_ena = 0;
				Jump_ena = 0;
				Ret_ena = 0;
				bnez_ena = 0;
				end
	
	`BEQ	:	begin
				ls_w_mode = 0;
				sel_in2 = 0;
				ena_data = 0;
				data_rw = 0;
				sel_wb = 0;
				reg_rw = 0;
				sign_ena = 1;
				funct = 4'd0;
				sel = 4'd1;
				sel_alu = 0;
				branch_ena = 1;
				Jump_ena = 0;
				Ret_ena = 0;
				bnez_ena = 0;
				end
	
	`J		:	begin
				ls_w_mode = 0;
				sel_in2 = 0;
				ena_data = 0;
				data_rw = 0;
				sel_wb = 0;
				reg_rw = 0;
				sign_ena = 1;
				funct = 4'd0;
				sel = 4'd5;	
				sel_alu = 0;	
				branch_ena = 0;
				Jump_ena = 1;
				Ret_ena = 0;
				bnez_ena = 0;
				end
	
	`LSW    :	begin
				ls_w_mode = 1;
				sel_in2 = 0;
				sign_ena = 0;
				sel = 4'd0;	
				funct = 4'd9;
				sel_alu = 0;
				branch_ena = 0;
				Jump_ena = 0;
				Ret_ena = 0;
				bnez_ena = 0;
				if (subopcode==5'b00010) begin//LW
					ena_data = 1;
				    data_rw = 0;
					sel_wb = 0;
					reg_rw = 1;
				end
				else begin					//SW
					ena_data = 0;
				    data_rw = 1;
					sel_wb = 0;
					reg_rw = 0;
				end
				end

	`LWI	:	begin
				ls_w_mode = 0;
				sel_in2 = 1;
				ena_data = 1;
				data_rw = 0;
				sel_wb = 0;
				reg_rw = 1;
				sign_ena = 0;
				funct = 4'd9;
				sel = 4'd2;	
				sel_alu = 0;
				branch_ena = 0;
				Jump_ena = 0;
				Ret_ena = 0;
				bnez_ena = 0;
				end
						
	`SWI	:	begin
				ls_w_mode = 0;
				sel_in2 = 1;
				ena_data = 0;
				data_rw = 1;
				sel_wb = 0;
				reg_rw = 0;
				sign_ena = 0;
				funct = 4'd9;
				sel = 4'd2;	
				sel_alu = 0;
				branch_ena = 0;
				Jump_ena = 0;
				Ret_ena = 0;
				bnez_ena = 0;
				end
	`SLTSI	:	begin
				ls_w_mode = 0;
				sel_in2 = 1;
				ena_data = 0;
				data_rw = 0;
				sel_wb = 1;
				reg_rw = 1;
				sign_ena = 1;
				funct = 4'd10;
				sel = 4'd2;	
				sel_alu = 0;
				branch_ena = 0;
				Jump_ena = 0;
				Ret_ena = 0;
				bnez_ena = 0;
				end
	`BEQN	:	begin
				ls_w_mode = 0;
				sel_in2 = 0;
				ena_data = 0;
				data_rw = 0;
				sel_wb = 0;
				reg_rw = 0;
				sign_ena = 1;
				funct = 4'd0;
				sel = 4'd4;	
				sel_alu = 0;
				if (beq_typ==4'b0010) begin//BEQZ
					branch_ena = 1;
					bnez_ena = 0;
				end
				else begin					//BNEZ
					branch_ena = 0;
					bnez_ena = 1;
				end
				Jump_ena = 0;
				Ret_ena = 0;
				end	
	`SUBRI	:	begin
				ls_w_mode = 0;
				sel_in2 = 1;		//1:ext   0:in2
				ena_data = 0;
				data_rw =0;
				sel_wb = 1;			//1:alu		0:mem
				reg_rw = 1;
				sign_ena = 1;
				funct = 4'd1;
				sel = 4'd2;
				sel_alu = 0;
				branch_ena = 0;
				Jump_ena = 0;
				Ret_ena = 0;
				bnez_ena = 0;
				end
	`MUL	:	begin
				ls_w_mode = 0;
				sel_in2 = 0;
				ena_data = 0;
				data_rw =0;
				sel_wb = 1;
				reg_rw = 1;
				sign_ena = 0;
				funct = 4'd12;
				sel = 4'd0;
				sel_alu = 0;
				branch_ena = 0;
				Jump_ena = 0;
				Ret_ena = 0;
				bnez_ena = 0;
				end
	`RET	:	begin
				ls_w_mode = 0;
				sel_in2 = 0;
				ena_data = 0;
				data_rw = 0;
				sel_wb = 0;
				reg_rw = 0;
				sign_ena = 1;
				funct = 4'd0;
				sel = 4'd5;	
				sel_alu = 0;	
				branch_ena = 0;
				Jump_ena = 1;
				Ret_ena = 1;
				bnez_ena = 0;
				end
	default	:	begin
				ls_w_mode = 0;
				sel_in2 = 1;
				ena_data = 0;
				data_rw = 0;
				sel_wb = 0;
				reg_rw = 0;
				sign_ena = 0;
				funct = 4'd0;
				sel = 4'd0;	
				sel_alu = 0;
				branch_ena = 0;
				Jump_ena = 0;
				Ret_ena = 0;
				bnez_ena = 0;
				end	
	endcase
end

endmodule
