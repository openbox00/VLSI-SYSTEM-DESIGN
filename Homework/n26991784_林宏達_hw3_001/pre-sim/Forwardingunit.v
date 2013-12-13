//forwarding unit
`timescale 1ns/10ps

module Forward(forwardA, forwardB, addr2_out, addr1_out, addr_dst_reg_out, addr_dst_reg2_out, reg_rw_out_exe, reg_rw_out_mem, data_rw_reg_out, sel_data_in, addr_dst
				, addr1, branch_ena, sel_data1, sel_data3, addr_dst_out, addr2, sel_data2_in, sel_data1_in);
output reg [1:0] forwardA;
output reg [1:0] forwardB;
output reg sel_data_in;
output reg [1:0] sel_data1;
output reg [1:0] sel_data3;
output reg sel_data2_in;
output reg sel_data1_in;

input  [4:0] addr1_out;
input  [4:0] addr2_out;
input  [4:0] addr_dst_reg_out;
input  [4:0] addr_dst_reg2_out;
input	reg_rw_out_exe;
input	reg_rw_out_mem;
input	data_rw_reg_out;


input	[4:0] addr_dst_out;
input	[4:0] addr_dst;
input	[4:0] addr1;
input	[4:0] addr2;
input	branch_ena;



always @ (addr1_out or addr2_out or addr_dst_reg_out or addr_dst_reg2_out or reg_rw_out_mem or reg_rw_out_exe)
begin
	if ( (reg_rw_out_exe==1) && (addr_dst_reg_out == addr1_out) )
		forwardA = 2'd1;  //alu
		
	else if ((addr_dst_reg2_out == addr1_out) && (reg_rw_out_mem == 1)) 
		forwardA = 2'd2;  //wb

	else 
		forwardA = 2'd0;  //in1
end

		
always @ (addr1_out or addr2_out or addr_dst_reg_out or addr_dst_reg2_out or reg_rw_out_mem or reg_rw_out_exe )
begin
	if ((addr_dst_reg_out == addr2_out) && (reg_rw_out_exe==1))

		forwardB = 2'd1;  //alu
		
	else if((addr_dst_reg2_out == addr2_out) && (reg_rw_out_mem == 1) ) 

		forwardB = 2'd2;  //wb

	else 
		forwardB = 2'd0;  //in1
end

always @ (data_rw_reg_out or addr_dst_reg2_out or addr_dst_reg_out)
begin
	if ((data_rw_reg_out==1) && (addr_dst_reg2_out==addr_dst_reg_out))
		sel_data_in = 1;
	else sel_data_in = 0;
end
	
always @ (branch_ena or addr_dst or addr_dst_out or addr_dst_reg_out or addr_dst_reg2_out)
begin
	if((branch_ena==1) && (addr_dst==addr_dst_out))
	sel_data3 = 2'd1;  //alu
	else if ((branch_ena==1) && (addr_dst==addr_dst_reg_out))
	sel_data3 = 2'd2;   //wb
	else if ((branch_ena==1) && (addr_dst==addr_dst_reg2_out))
	sel_data3 = 2'd3;	
	else
	sel_data3 = 2'd0;
end


always @ (branch_ena or addr_dst_out or addr1 or addr_dst_reg_out or addr_dst_reg2_out)
begin
	if((branch_ena==1) && (addr1==addr_dst_out))
	sel_data1 = 2'd1;
	else if ((branch_ena==1) && (addr1==addr_dst_reg_out))
	sel_data1 = 2'd2;
	else if ((branch_ena==1) && (addr1==addr_dst_reg2_out))
	sel_data1 = 2'd3;	
	else
	sel_data1 = 2'd0;
end

always @ (addr_dst_reg2_out or addr1 or reg_rw_out_mem)
begin
	if ((addr_dst_reg2_out == addr1) && (reg_rw_out_mem == 1))
		sel_data1_in = 1;
	else
		sel_data1_in = 0;
end

always @ (addr2 or addr_dst_reg2_out or reg_rw_out_mem)
begin
	if ((addr_dst_reg2_out == addr2) && (reg_rw_out_mem == 1) )	
		sel_data2_in = 1;
	else
		sel_data2_in = 0;
end

endmodule
