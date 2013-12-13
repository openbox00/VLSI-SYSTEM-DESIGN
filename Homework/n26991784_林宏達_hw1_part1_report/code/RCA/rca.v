`timescale 1ns/10ps
module Add_4bitRCA(ovudsign,ovudunsign,sum,cout,a,b,addsub);
  output  [3:0]   sum;
  output          cout,ovudsign,ovudunsign;
  input   [3:0]   a,b;
  input           addsub;
  wire            c_in2,c_in3,c_in4;
  wire    [3:0]   bout;


xor(bout[0],b[0],addsub);
xor(bout[1],b[1],addsub);
xor(bout[2],b[2],addsub);
xor(bout[3],b[3],addsub);


Add_full M1(sum[0],     c_in2,  a[0],   bout[0],   addsub);
Add_full M2(sum[1],     c_in3,  a[1],   bout[1],   c_in2);
Add_full M3(sum[2],     c_in4,  a[2],   bout[2],   c_in3);
Add_full M4(sum[3],     cout,   a[3],   bout[3],   c_in4);

xor (ovudunsign,cout,addsub);
xor (ovudsign,cout,c_in4);

endmodule

//fulladder
module Add_full(sum,c_out,a,b,c_in);
  output  sum,c_out;
  input   a,b,c_in;
  wire    w1,w2,w3;

Add_half M1(w1,w2,a,b);
Add_half M2(sum,w3,w1,c_in);
xor      (c_out,w3,w2);     

endmodule

//halfadder
module Add_half(sum,c_out,a,b);
  output  c_out,sum;
  input   a,b;

and     (c_out, a,   b);
xor     (sum,   a,   b);

endmodule
