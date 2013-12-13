module CONTROLLER(clk, rst_n, opcode, sub_op, fetch_ena, reg_rw, 
				 funct, mem_ena, mem_rw, sel_alu_in, sel_wb, 
				 sel_ext, ls_w_mode, sign_ena, alu_ena, reg_alu_ena);
input clk, rst_n;
input [5:0] opcode;
input [4:0] sub_op;

output reg fetch_ena, reg_alu_ena, reg_rw, mem_ena, mem_rw, sel_alu_in, sign_ena, alu_ena;
output reg [1:0] sel_wb, sel_ext;
output reg [3:0] funct;
output reg ls_w_mode;

reg [2:0] present_state, next_state;

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

parameter 	S0 = 3'd0,
			S1 = 3'd1,
			S2 = 3'd2,
			S3 = 3'd3,
			S4 = 3'd4;

always@(posedge clk, negedge rst_n)			
begin
	if(!rst_n) present_state <= S0;
	else present_state <= next_state;
end

always@(present_state)
begin
	case(present_state)
		S0: next_state = S1;
		S1: next_state = S2;
		S2: next_state = S3;
		S3: next_state = S4;
		default: next_state = S0;
	endcase
end

always@(present_state, opcode, sub_op)
begin
	case(present_state)
		S0:	begin
			fetch_ena = 1;
			reg_rw = 0;
			funct = 3'd0;
			mem_ena = 0;
			mem_rw = 0;
			sel_alu_in = 0;
			sel_wb = 0;
			ls_w_mode = 0;
			sel_ext = 0;
			sign_ena = 0;
			alu_ena = 0;
			reg_alu_ena = 0;
		end
		
		S1:	begin
			fetch_ena = 0;
			reg_rw = 0;
			funct = 3'd0;
			mem_ena = 0;
			mem_rw = 0;
			sel_alu_in = 0;
			sel_wb = 0;
			ls_w_mode = 0;
			sel_ext = 0;
			sign_ena = 0;
			alu_ena = 0;
			reg_alu_ena = 0;			
		end
		
		//execution
		S2:	begin
			fetch_ena = 0;
			reg_rw = 0;
			mem_ena = 0;
			mem_rw = 0;
			sel_wb = 0;
			alu_ena = 1;
			reg_alu_ena = 1;
			
			if(opcode == `ADDI || opcode == `MOVI ) sign_ena = 1;			
			else sign_ena = 0;
			
			case(opcode)
				`STD: begin
					ls_w_mode = 0;
					sel_ext = 0;
					
					if(sub_op == `SRLI || sub_op == `SLLI || sub_op == `ROTRI )
						sel_alu_in = 1;						
					else sel_alu_in = 0;
					
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
				`ADDI: begin
					ls_w_mode = 0;
					funct = 4'd1;
					sel_ext = 1;
					sel_alu_in = 1;
				end
				`ORI: begin
					ls_w_mode = 0;
					funct = 4'd4;
					sel_ext = 1;
					sel_alu_in = 1;
				end
				`XORI: begin
					funct = 4'd5;
					ls_w_mode = 0;
					sel_ext = 1;
					sel_alu_in = 1;
				end
				
				`LWI, `SWI: begin
					funct = 4'd10;
					ls_w_mode = 0;
					sel_ext = 1;
					sel_alu_in = 1;					
				end
				`MOVI:	begin
					funct = 4'd9;
					ls_w_mode = 0;
					sel_ext = 2;
					sel_alu_in = 1;					
				end
				`LSW: begin
					funct = 4'd10;
					ls_w_mode = 1;
					sel_ext = 0;
					sel_alu_in = 0;					
				end
				 default: begin
					funct = 4'd0;
					ls_w_mode = 0;
					sel_ext = 0;
					sel_alu_in = 0;					
				end
			endcase
		end
		
		S3: begin
			fetch_ena = 0;			
			funct = 4'd0;
			mem_ena = 1;
			sel_alu_in = 0;
			sel_ext = 0;
			ls_w_mode = 0;
			sign_ena = 0;
			alu_ena = 0;
			reg_alu_ena = 0;
			reg_rw = 0;
			sel_wb = 0;
			
			if(opcode == `SWI || (opcode == `LSW && sub_op == 5'b01010))
				 mem_rw = 1;
			else mem_rw = 0;	
		end
		
		default: begin
			fetch_ena = 0;
			funct = 3'd0;
			mem_ena = 0;
			mem_rw = 0;
			sel_alu_in = 0;
			ls_w_mode = 0;
			sel_ext = 0;
			sign_ena = 0;
			alu_ena = 0;
			reg_alu_ena = 0;
			
			if(opcode == `SWI || (opcode == `LSW && sub_op == 5'b01010))
				 reg_rw = 0;
			else reg_rw = 1;
			
			case(opcode)
				`MOVI: sel_wb = 0;
				`LSW, `LWI:  sel_wb = 1;
				default: sel_wb = 2;
			endcase			
		end
	endcase
end

endmodule
