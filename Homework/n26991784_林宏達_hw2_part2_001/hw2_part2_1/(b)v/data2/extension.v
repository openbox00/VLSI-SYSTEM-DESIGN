`timescale 1ns/10ps

module EXTENSION(sign_ena, sel, imm_field, ext_out);
input sign_ena;
input [2:0] sel;
input [23:0] imm_field;
output reg [31:0] ext_out;

parameter imm_5  = 3'd0,
          imm_14 = 3'd1,
		  imm_15 = 3'd2,
		  imm_20 = 3'd3,
		  imm_24 = 3'd4;
		  

always@(sel, imm_field, sign_ena)
begin
	case(sel)
	imm_5:	 ext_out = {{27{imm_field[14]&sign_ena}}, imm_field[14:10]};
	imm_14:	 ext_out = ({{18{imm_field[13]&sign_ena}}, imm_field[13:0]}<<1)-32'd4;		
	imm_15:	 ext_out = {{17{imm_field[14]&sign_ena}}, imm_field[14:0]};	
	imm_20:  ext_out = {{12{imm_field[19]&sign_ena}}, imm_field[19:0]};	
	default: ext_out = ({{8{imm_field[23]&sign_ena}}, imm_field[23:0]}<<1)-32'd4;	
	endcase
end

endmodule
