

`timescale 1ns/10ps

module barrel_shifter(inreg,shsize,outreg);

parameter REGSIZE = 64;
parameter SHIFTSIZE = 6;

input  [REGSIZE-1:0]    inreg;
input  [SHIFTSIZE -1:0] shsize;
output [REGSIZE-1:0]    outreg;
  
assign  outreg = inreg >>shsize;

endmodule

