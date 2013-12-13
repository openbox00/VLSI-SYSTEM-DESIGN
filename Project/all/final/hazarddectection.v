//hazard detection
`timescale 1ns/10ps

module detection(stall, ena_data_out, addr_dst_out, addr1, addr2);

input ena_data_out;
input [4:0] addr_dst_out;
input [4:0] addr1;
input [4:0] addr2;

output reg stall;


always @ (ena_data_out or addr_dst_out or addr1 or addr2)
begin
	if ((ena_data_out==1) && ((addr_dst_out==addr1) || (addr_dst_out==addr2)))
		stall = 1;
	else stall = 0;
end


endmodule
		
		