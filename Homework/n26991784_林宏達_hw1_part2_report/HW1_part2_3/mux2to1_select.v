`timescale 1ns/10ps

module mux2to1_select(write_data,src2,alu_result,mux2to1_select);
  output reg [31:0] write_data;
  input [31:0] src2;
  input [31:0] alu_result;
  input mux2to1_select;
 
 always @ (src2 or alu_result or mux2to1_select) 
  begin
    if (mux2to1_select==0)begin
        write_data<=src2;
        end
  
    else begin 
        write_data<=alu_result;
        end
  end
endmodule