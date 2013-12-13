`timescale 1ns/10ps
module t_Add_4bitRCA;
  wire  [3:0]   sum;
  wire          cout,ovudsign,ovudunsign;
  reg   [3:0]   a,b;
  reg           addsub;
  

Add_4bitRCA   M1(ovudsign,ovudunsign,sum,cout,a,b,addsub);

/*initial begin
  $monitor($time,"addsub= %d, a = %d, b = %d, cout = %d, sum = %d,  ovudsign = %d, ovudunsign = %d",
                  addsub,a,b,cout,sum,ovudsign,ovudunsign);

end*/

initial begin
  
        a=0; 
        b=0;
        addsub=1;
#10     a=1;
        b=10;
#10     addsub=0;
        a=4;
        b=5;
#10     addsub=0;
        a=10;
        b=6;
#10     a=1;
        b=2;
        addsub=1;
#10     a=3;
        b=9;
        addsub=0;
#10     a=13;
        b=8;
        addsub=1;
#10     addsub=0;
        a=10;
        b=1;
#10     addsub=0;
        a=0;
        b=9;
#10     addsub=0;
        a=3;
        b=4;
#10     a=7;
        b=3;
        addsub=1;
#10     a=3;
        b=9;
        addsub=0;
#10     a=13;
        b=8;
end
initial begin
  #500 $finish;
end

initial begin
$dumpfile("rca.vcd");
$dumpvars;
end
endmodule

