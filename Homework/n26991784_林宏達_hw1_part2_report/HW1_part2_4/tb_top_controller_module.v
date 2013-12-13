//top_module_controller
`define cycle 100
`timescale 1ns/10ps


module tb_top_module_controller();
	wire alu_overflow;
	reg [31:0] ir;
	reg clk,reset;
	 

top_module_controller tb(alu_overflow,ir,clk,reset);

initial begin
  $monitor($time,"alu_overflow= %d, ir = %d, reset = %d, R0 = %d, R1 = %d, R2 = %d, R3 = %d",
                  alu_overflow,ir,reset,tb.register.rw_reg[0],tb.register.rw_reg[1],tb.register.rw_reg[2],tb.register.rw_reg[3]);
 end

 initial begin
			
			reset=1;ir=32'b0;		
				
#(`cycle*4)   	 reset=0;
				 ir=32'b0_101000_00000_00000_0000_0000_0001_101;	//ADDI  R0=R0+5'b01101

#(`cycle*4)    	 ir=32'b0_101000_00001_00001_0000_0000_0001_100;	//ADDI  R1=R1+5'b01100	
				
#(`cycle*4)      ir=32'b0_100010_00010_0000_0000_0000_0001_0000;	//MOVI  R2=5'b010000	

#(`cycle*4)      ir=32'b0_100000_00011_00000_00001_00000_00000;		//ADD   R3=R0+R1	

#(`cycle*4)      ir=32'b0_100000_00100_00000_00001_00000_00001;		//SUB   R4=R0-R1	

#(`cycle*4)      ir=32'b0_100000_00101_00011_00100_00000_00010;		//AND   R5=R3&R4	

#(`cycle*4)      ir=32'b0_100000_00110_00011_00100_00000_00100;		//OR    R6=R3|R4	

#(`cycle*4)      ir=32'b0_100000_00111_00011_00100_00000_00011;		//XOR   R7=R3^R4	

#(`cycle*4)      ir=32'b0_100000_01000_00000_00100_00000_01000;		//SLLI  R8=R0<<5'b00100	

#(`cycle*4)      ir=32'b0_100000_01001_00001_01000_00000_01011;		//ROTRI R9=R1>>5'b01000	

#(`cycle*4)      ir=32'b0_101100_00000_00000_0000_0000_0011_111;	//ORI   R0=R0|5'b11111	

#(`cycle*4)      ir=32'b0_101011_00001_00001_0000_0000_0010_101;	//XORI  R1=R1^5'b10101		
 end 
 
 
 
initial begin
	clk = 0;
	forever #(`cycle/2) clk = ~clk;
end
 
initial begin
   #6000 $finish;
end

initial begin
$dumpfile("top.vcd");
$dumpvars;
end
endmodule 
 

