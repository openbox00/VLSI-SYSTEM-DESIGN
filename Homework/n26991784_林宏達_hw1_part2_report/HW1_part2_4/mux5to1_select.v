`timescale 1ns/10ps

module mux5to1_select(mux5to1_result,immediate,mux5to1_select);
  output reg [19:0] mux5to1_result;
  input [19:0] immediate;
  input [2:0] mux5to1_select;
 
 always @ (immediate or mux5to1_select) 
  begin
    case(mux5to1_select)
        3'b000 : begin
                    mux5to1_result = {{15{immediate[4]}},immediate[14:10]};
                 end          
        3'b001 : begin
                    mux5to1_result = {{5{immediate[14]}},immediate[14:0]};
                 end
        3'b010 : begin
                    mux5to1_result = {15'b0,immediate[14:10]}; 
                 end
        3'b011 : begin
                    mux5to1_result = {5'b0,immediate[14:0]};
                 end
        default:begin
                  mux5to1_result = immediate;
                end
      endcase 
    end
endmodule
