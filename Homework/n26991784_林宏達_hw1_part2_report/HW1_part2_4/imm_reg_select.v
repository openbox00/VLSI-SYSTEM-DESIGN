`timescale 1ns/10ps

module imm_reg_select(src2,read_data2,immediate,imm_reg_select);
  output reg [31:0] src2;
  input [31:0] read_data2;
  input [31:0] immediate;
  input imm_reg_select;
 
 always @ (read_data2 or immediate or imm_reg_select) 
  begin
    if (imm_reg_select==0)begin
        src2<=read_data2;
        end
  
    else begin 
        src2<=immediate;
        end
  end
endmodule
