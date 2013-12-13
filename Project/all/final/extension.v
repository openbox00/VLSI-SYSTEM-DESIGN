`timescale 1ns/10ps

module EXTENSION(sign_ena, sel, imm_field, ext_out);

input sign_ena;
input [3:0] sel;
input [23:0] imm_field;
output reg [31:0] ext_out;

always@(sel, imm_field, sign_ena)
begin
	case(sel)
	4'd0	:	ext_out = {{27{imm_field[14]&sign_ena}}, imm_field[14:10]};//for std
	4'd1	:	ext_out = {{18{imm_field[13]&sign_ena}},imm_field[13:0]<<1};	//for beq
	4'd2	:	ext_out = {{17{imm_field[14]&sign_ena}}, imm_field[14:0]};//for addi
	4'd3	:   ext_out = {{12{imm_field[19]&sign_ena}}, imm_field[19:0]};//for movi
	4'd4	:	ext_out = {{16{imm_field[15]&sign_ena}}, imm_field[15:0]<<1};//for BEQZ
	default : 	ext_out = {{8{imm_field[23]}}, imm_field[23:0]<<1};//for jump	
	endcase
end

endmodule
