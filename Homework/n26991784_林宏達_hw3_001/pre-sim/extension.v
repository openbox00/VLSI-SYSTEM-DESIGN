`timescale 1ns/10ps

module EXTENSION(sign_ena, sel, imm_field, ext_out);

input sign_ena;
input [2:0] sel;
input [23:0] imm_field;
output reg [31:0] ext_out;

always@(sel, imm_field, sign_ena)
begin
	case(sel)
	3'd0	:	ext_out = {{27{imm_field[14]&sign_ena}}, imm_field[14:10]};//for std
	3'd1	:	ext_out = ({{18{imm_field[13]&sign_ena}}, imm_field[13:0]}<<1);	//for beq
	3'd2	:	ext_out = {{17{imm_field[14]&sign_ena}}, imm_field[14:0]};//for addi
	3'd3	:   ext_out = {{12{imm_field[19]&sign_ena}}, imm_field[19:0]};//for movi	
	default : 	ext_out = ({{8{imm_field[23]&sign_ena}}, imm_field[23:0]}<<1);//for jump	
	endcase
end

endmodule
