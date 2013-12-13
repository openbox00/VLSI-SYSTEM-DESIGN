`timescale 1ns/10ps

module sign_extend(sign_out,sign_in);
  output reg [31:0] sign_out;
  input [19:0] sign_in;
  
 always @ (sign_in)
  begin
    sign_out  = {{12{sign_in[19]}},sign_in};
  end  
 
endmodule
