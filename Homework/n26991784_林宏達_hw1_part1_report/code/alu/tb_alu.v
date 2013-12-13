`timescale 1ns/10ps
module t_alu();

  wire  [31:0] alu_result;
  wire         alu_overflow;
  
  reg   [31:0] scr1,scr2;
  reg   [5:0]  opcode;
  reg   [4:0]  sub_opcode;
  reg          reset;
  reg          enable_execute;
   
  
alu M1(alu_result,alu_overflow,scr1,scr2,opcode,sub_opcode,enable_execute,reset);


/*initial begin
  $monitor($time,"result= %d, overflow = %d, scr1 = %d, scr2 = %d, opcode = %d,  sub_opcode = %d, enable_execute = %d,  reset = %d",
                  alu_result,alu_overflow,scr1,scr2,opcode,sub_opcode,enable_execute,reset);
 end*/


initial begin
  
       scr1=32'hFFFFFFFF;scr2=32'hEEEEEEEE;opcode=6'b100000;sub_opcode=5'b01001;enable_execute=0;reset=1;
      
       #10   
       scr1=32'h00000000;scr2=32'h00000000;opcode=6'b100000;sub_opcode=5'b01001;enable_execute=1;reset=0;

       #10   
       scr1=32'h33333333;scr2=32'h44444444;opcode=6'b100000;sub_opcode=5'b00000;enable_execute=1;reset=0;
       
       #10   
       scr1=32'h66666666;scr2=32'h55555555;opcode=6'b100000;sub_opcode=5'b00001;
       
       #10   
       scr1=32'h77777777;scr2=32'h88888888;opcode=6'b100000;sub_opcode=5'b00010;
       
       #10   
       scr1=32'h88888888;scr2=32'h77777777;opcode=6'b100000;sub_opcode=5'b00100;
       
       #10   
       scr1=32'h77777777;scr2=32'h88888888;opcode=6'b100000;sub_opcode=5'b00011;
       
       #10   
       scr1=32'h11110000;scr2=32'h00000004;opcode=6'b100000;sub_opcode=5'b01001;
       
       #10   
       scr1=32'h00001111;scr2=32'h00000004;opcode=6'b100000;sub_opcode=5'b01000;
       
       #10   
       scr1=32'h11111110;scr2=32'h00000004;opcode=6'b100000;sub_opcode=5'b01011;
       
       

end

initial begin
   #500 $finish;
end

initial begin
$dumpfile("alu.vcd");
$dumpvars;
end
endmodule
