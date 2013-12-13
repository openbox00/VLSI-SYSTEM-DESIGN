module DATA_MEM(clk, rst_n, read_write, enable, addr, data_in, data_out);

parameter data_size = 32;
parameter addr_size = 7;
parameter mem_width = 8;
parameter mem_size = 128;

input clk, rst_n, enable, read_write;
input [addr_size-1:0] addr;
input [data_size-1:0] data_in;
output reg [data_size-1:0] data_out;
reg [mem_width-1:0] data [mem_size-1:0];

integer i;

always@(posedge clk)
begin
	if(!rst_n) begin
		for(i=0; i<mem_size; i=i+1) data[i] <= 8'd0;
		data_out <= 32'd0;
	end
	else if(enable) begin
		if(read_write) {data[addr], data[addr+1], data[addr+2], data[addr+3]} <= data_in;	 
		else data_out <= {data[addr], data[addr+1], data[addr+2], data[addr+3]};
	end
end

endmodule
