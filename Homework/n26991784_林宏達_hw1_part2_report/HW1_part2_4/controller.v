//controller
`timescale 1ns/10ps

`define opcode 		ir[30:25]
`define sub_opcode 	ir[4:0]
`define SRLI		5'b01001
`define SLLI		5'b01000
`define ROTRI		5'b01011

module controller(enable_execute,read,write,opcode,sub_opcode,mux5to1_select,mux2to1_select,imm_reg_select,clk,reset,ir);

	input clk;
	input reset;
	input [31:0] ir;
	
	
	output reg enable_execute;
	output reg read;
	output reg write;
	output [5:0] opcode;
	output [4:0] sub_opcode;
	output reg [2:0] mux5to1_select;
	output reg mux2to1_select;
	output reg imm_reg_select;
	
	
	wire [5:0] opcode = ir[30:25];
	wire [4:0] sub_opcode = ir[4:0];
	reg [1:0] current_state;
	reg [1:0] next_state;
		
	parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
	
	always @ (posedge clk)
	begin
		if(reset)
			current_state <= S0;
		else
			current_state <= next_state;
	end
		
	always @ (current_state or opcode or sub_opcode)
	begin
		case(current_state)
			S0	:	begin
						next_state = S1;
						read = 0;
						enable_execute =0;
						write = 0;
						mux5to1_select = 3'b0;
						mux2to1_select = 0;
						imm_reg_select = 0;
					end
			S1	:	begin
						next_state = S2;
						read = 1;
						enable_execute = 0;
						write = 0;
						mux5to1_select = 3'b0;
						mux2to1_select = 0;
						imm_reg_select = 0;
					end
			S2	:	begin								
						next_state = S3;
						read = 0;
						enable_execute = 1;
						write = 0; 
						case(opcode)
							6'b100000	:	begin
											mux5to1_select = 3'b010;
											
											case(sub_opcode)
											5'b01001,5'b01000,5'b01011 : begin
																			imm_reg_select = 1'b1;
																		 end
											default :	begin
														imm_reg_select = 1'b0;
														end
											endcase
											end
							6'b101000	:	begin
											mux5to1_select = 3'b001;
											imm_reg_select = 1'b1;
											end
							6'b101100,
							6'b101011	:	begin
											mux5to1_select = 3'b011;
											imm_reg_select = 1'b1;
											end	
							default :	begin
										mux5to1_select = 3'b100;
										imm_reg_select = 1'b1;
										end
						endcase
						if(opcode == 6'b100010)
							begin
							mux2to1_select = 0;
							end
							else begin
							mux2to1_select = 1;
							end
					end
			S3	:	begin
						next_state = S0;
						read = 0;
						enable_execute = 0;
						write = 1; 
						imm_reg_select = 0;
						mux5to1_select = 3'b0;
						mux2to1_select = 0;
					end
		endcase
	end
endmodule
