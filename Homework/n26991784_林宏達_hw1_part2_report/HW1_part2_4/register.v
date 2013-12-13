`timescale 1ns/10ps

module regfile(read_data1,read_data2,read_address1,read_address2,write_address,write_data,clk,reset,read,write);
  parameter datasize = 32;
  parameter addrsize = 5;
  
  output reg [datasize-1:0] read_data1;
  output reg [datasize-1:0] read_data2;
  
  input [addrsize-1:0] read_address1;
  input [addrsize-1:0] read_address2;
  input [addrsize-1:0] write_address;
  input [datasize-1:0] write_data;
  input clk,reset,read,write;
  
  reg [31:0] rw_reg [datasize-1:0];
  integer i = 0;
  
  always @ (posedge clk or posedge reset)begin
    if(reset)begin
      for(i=0;i<32;i=i+1)
        rw_reg[i]<=32'd0;
      end
    else begin
      if(read)begin
        read_data1<=rw_reg[read_address1];
        read_data2<=rw_reg[read_address2];
      end
    else if(write)begin
      rw_reg[write_address]<=write_data;
    end
  else begin
    read_data1<=32'd0;
    read_data2<=32'd0;
  end
end
end
endmodule

