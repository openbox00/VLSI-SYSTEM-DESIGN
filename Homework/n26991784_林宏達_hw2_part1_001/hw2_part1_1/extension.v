module EXTENSION(sign_ena, sel, imm_field, ext_out);
input sign_ena;
input [1:0] sel;
input [19:0] imm_field;
output reg [31:0] ext_out;

parameter imm_5  = 2'd0,
          imm_15 = 2'd1,
		  imm_20 = 2'd2;

always@(sel, imm_field, sign_ena)
begin
	case(sel)
	imm_5:	 ext_out = {{27{imm_field[14]&sign_ena}}, imm_field[14:10]};	
	imm_15:	 ext_out = {{17{imm_field[14]&sign_ena}}, imm_field[14:0]};	
	default: ext_out = {{12{imm_field[19]&sign_ena}}, imm_field[19:0]};		
	endcase
end

endmodule
