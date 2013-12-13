`timescale 1ns/10ps

module buffer(write_data,mux2to1_result,write);
  output reg [31:0] write_data;
  input [31:0] mux2to1_result;
  input write;
  
 always @ (write) begin
	write_data =  mux2to1_result;
	end 
endmodule
