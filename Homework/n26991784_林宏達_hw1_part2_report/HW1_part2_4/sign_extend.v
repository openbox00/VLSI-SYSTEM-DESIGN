`timescale 1ns/10ps

module sign_extend(sign_out,mux5to1_result);
  output reg [31:0] sign_out;
  input [19:0] mux5to1_result;
  
 always @ (mux5to1_result)
  begin
    sign_out  = {{12{mux5to1_result[19]}},mux5to1_result};
  end  
 
endmodule
