`timescale 1ns/10ps


module CPU(clk, rst);
input 	clk, rst;

wire 	[5:0] 	opcode;
wire 	[4:0] 	subopcode;
wire 	[31:0] 	pc;
reg		[31:0]	next_pc;
wire	[31:0]	inst_out;
wire	[31:0]	inst_out2;
wire	[31:0]	pc_shift;
wire 	sign_ena;
wire	[3:0]	sel;
wire	[31:0]	ext_out;
wire	[31:0]	inst_in;
wire	[31:0]	next_pc_out;
wire	flush;
wire	reg_rw_reg2_out;
wire	reg_ena;
wire	[4:0]	addr1;
wire	[4:0]	addr2;
wire	[4:0]	addr_dst_reg2_out;
wire	[31:0]	write_data;
wire	[31:0]	read_data1;
wire	[31:0]	read_data2;
wire	[31:0]	read_data3;
wire	sel_pc;
wire	ls_w_mode_out;
wire	[3:0]	funct_out;
wire	sel_in2_out;
wire	ena_data_out;
wire	data_rw_out;
wire	sel_wb_out;
wire	reg_rw_out;
wire	[31:0]	read_data1_out;
wire	[31:0]	read_data2_out;
wire	[31:0]	read_data3_out;
wire	[31:0]	ext_reg_out;
wire	[4:0]	addr_dst_out;
wire	[4:0]	addr_dst;
reg		[31:0]	source2;
wire	over_flow;
wire	[31:0]	alu_result;
wire	[31:0]	result;
wire	ena_data_reg_out;
wire	data_rw_reg_out;
wire	sel_wb_reg_out;
wire	reg_rw_reg_out;
wire	[31:0]	alu_result_out;
wire	[31:0]	read_data3_reg_out;

wire	[4:0]	addr_dst_reg_out;
wire	[31:0]	data_out;
wire	sel_wb_reg2_out;

wire	[31:0]	alu_result_reg_out;
wire	[31:0]	data_out_out;

wire [1:0] forwardA;
wire [1:0] forwardB;

wire  [4:0] addr1_out;
wire  [4:0] addr2_out;
reg 	[31:0] in2;
reg 	[31:0] in1;
wire	sel_alu;
wire	sel_alu_out;
wire	stall;
wire	sel_data_in;
wire	[31:0] data_in;

wire		reg_rw_in; 
wire		sel_wb_in; 
wire		data_rw_in;
wire		ena_data_in; 
wire		sel_in2_in;

wire		ls_w_mode_in; 
wire [3:0]	funct_in;	
		
wire reg_rw_in_control;
wire sel_wb_in_control;
wire data_rw_in_control;
wire ena_data_in_control;
wire sel_in2_in_control;

wire ls_w_mode_in_control;
wire [3:0] funct_in_control;
wire	Jump_ena;
wire	branch_ena;
wire	compare;

wire [1:0] sel_data1;
wire [1:0] sel_data3;
reg	[31:0]	read_data3_in;
wire [31:0] read_data2_in;
wire [31:0]	read_data1_in;
reg	[31:0]	read_data_in;
wire [31:0] data1;
wire sel_data2_in;
wire sel_data1_in;

wire Ret_ena;
wire bnez_ena;

wire [3:0] beq_typ;



always @ (posedge clk or negedge rst)
begin
	if (~rst) 
		next_pc = 32'd0;
	else if (stall)
		next_pc = next_pc;
	else
		next_pc = pc;		
end

always @ (ext_reg_out or in2 or sel_in2_out)
begin
	if(sel_in2_out==1)
		source2 = ext_reg_out;
	else 
		source2 = in2;
end

assign write_data = (sel_wb_reg2_out)?alu_result_reg_out:data_out_out;


always @ (read_data1_out or alu_result_out or write_data or forwardA)
begin
	case (forwardA)
	2'd0	:	in1 = read_data1_out;
	2'd1	:	in1 = alu_result_out;
	2'd2	:	in1 = write_data;
	default	:	in1 = read_data1_out;
	endcase
end

always @ (read_data2_out or alu_result_out or write_data or forwardB)
begin
	case (forwardB)
	2'd0	:	in2 = read_data2_out;
	2'd1	:	in2 = alu_result_out;
	2'd2	:	in2 = write_data;
	default	:	in2 = read_data2_out;
	endcase
end





always @ (read_data1 or result or alu_result_out or write_data or sel_data1)
begin
	case (sel_data1)
	2'd0	:	read_data_in = read_data1;
	2'd1	:	read_data_in = result;
	2'd2	:	read_data_in = alu_result_out;
	2'd3	:	read_data_in = write_data;
	endcase
end

always @ (read_data3 or result or alu_result_out or write_data or sel_data3)
begin
	case (sel_data3)
	2'd0	:	read_data3_in = read_data3;
	2'd1	:	read_data3_in = result;
	2'd2	:	read_data3_in = alu_result_out;
	2'd3	:	read_data3_in = write_data;
	endcase
end

assign data1 = (sel_data1_in)?write_data:read_data1;
assign read_data1_in = (branch_ena)?read_data_in:data1;
assign read_data2_in = (sel_data2_in)?write_data:read_data2;

		
assign reg_rw_in = reg_rw_in_control;
assign		sel_wb_in = sel_wb_in_control;
assign		data_rw_in = data_rw_in_control;
assign		ena_data_in = ena_data_in_control;
assign		sel_in2_in = sel_in2_in_control;

assign		ls_w_mode_in = ls_w_mode_in_control;
assign		funct_in = funct_in_control;		
	

	
assign sel_pc = ((compare&&branch_ena)||Jump_ena || ((read_data3==32'd0)&&branch_ena) || Ret_ena || ((|read_data3)&&bnez_ena))?1'd1:1'd0;


assign flush = ((compare&&branch_ena)||Jump_ena || ((read_data3==32'd0)&&branch_ena) || Ret_ena || ((|read_data3)&&bnez_ena))?1'd1:1'd0;	
	
assign alu_result = (sel_alu_out)?ext_reg_out:result;
	
assign data_in = (sel_data_in)?write_data:read_data3_reg_out;
	
		
assign {opcode, addr_dst, addr1, addr2} = inst_out[30:10];
assign beq_typ = inst_out[19:16];
assign subopcode = inst_out[4:0];
assign pc = sel_pc?pc_shift:(next_pc+32'd4);//sel pc in
assign pc_shift = (Ret_ena)?read_data2:(next_pc_out + ext_out);

assign compare = (read_data3_in==read_data1_in)?1'd1:1'd0;

EXTENSION ext(.sign_ena(sign_ena), .sel(sel), .imm_field(inst_out[23:0]), .ext_out(ext_out));

INST_MEM  inst_mem(.clk(clk), .pc({2'd0,next_pc[31:2]}), .inst_out(inst_in));

IFID	ifid(.pc_out(next_pc_out), .inst_out(inst_out), .pc_in(next_pc), .inst_in(inst_in), .clk(clk), .rst(rst), .flush(flush), .stall(stall));

REGISTER_FILE reg_file(.clk(clk), .rst(rst), .reg_rw(reg_rw_reg2_out), .reg_ena(reg_ena), .addr1(addr1), .addr2(addr2), .addr_dst(addr_dst), .write_data(write_data)
						, .write_addr(addr_dst_reg2_out), .read_data1(read_data1), .read_data2(read_data2), .read_data3(read_data3));
						
CONTROLLER ctrl(.reg_ena(reg_ena), .funct(funct_in_control), .ls_w_mode(ls_w_mode_in_control), .sign_ena(sign_ena) 
					, .sel_in2(sel_in2_in_control), .ena_data(ena_data_in_control), .data_rw(data_rw_in_control), .sel_wb(sel_wb_in_control)
					, .reg_rw(reg_rw_in_control), .sel(sel), .opcode(opcode), .subopcode(subopcode) 
					, .read_data1(read_data1), .read_data2(read_data2), .clk(clk), .rst(rst), .sel_alu(sel_alu)
					, .branch_ena(branch_ena), .Jump_ena(Jump_ena), .Ret_ena(Ret_ena)
					, .beq_typ(beq_typ), .bnez_ena(bnez_ena));

IDEX	idex(.ls_w_mode_out(ls_w_mode_out), .funct_out(funct_out), .sel_in2_out(sel_in2_out), .ena_data_out(ena_data_out)
			, .data_rw_out(data_rw_out), .sel_wb_out(sel_wb_out), .reg_rw_out(reg_rw_out), .read_data1_out(read_data1_out)
			, .read_data2_out(read_data2_out), .read_data3_out(read_data3_out), .ext_out(ext_reg_out), .addr_dst_out(addr_dst_out)
			, .ls_w_mode_in(ls_w_mode_in), .funct_in(funct_in), .sel_in2_in(sel_in2_in), .ena_data_in(ena_data_in)
			, .data_rw_in(data_rw_in), .sel_wb_in(sel_wb_in), .reg_rw_in(reg_rw_in), .read_data1_in(read_data1_in)
			, .read_data2_in(read_data2_in), .addr_dst_in(addr_dst), .read_data3_in(read_data3_in), .ext_in(ext_out), .clk(clk), .rst(rst)
			, .addr1_out(addr1_out), .addr1_in(addr1), .addr2_out(addr2_out), .addr2_in(addr2), .inst_out(inst_out2), .inst_in(inst_out)
			, .sel_alu_out(sel_alu_out), .sel_alu_in(sel_alu));

ALU alu(.ls_w_mode(ls_w_mode_out), .funct(funct_out), .sv(inst_out2[9:8]), .source1(in1)
		, .source2(source2), .over_flow(over_flow), .alu_result(result));

EXMEM exmem(.ena_data_out(ena_data_reg_out), .data_rw_out(data_rw_reg_out), .sel_wb_out(sel_wb_reg_out), .reg_rw_out(reg_rw_reg_out)
			, .alu_result_out(alu_result_out), .read_data3_out(read_data3_reg_out), .addr_dst_out(addr_dst_reg_out)
			, .ena_data_in(ena_data_out), .data_rw_in(data_rw_out), .sel_wb_in(sel_wb_out), .reg_rw_in(reg_rw_out) 
			, .alu_result_in(alu_result), .read_data3_in(read_data3_out), .addr_dst_in(addr_dst_out), .clk(clk), .rst(rst)); 

DATA_MEM data_mem(.clk(clk), .rst(rst), .data_rw(data_rw_reg_out), .ena_data(ena_data_reg_out), .addr(alu_result_out[17:0])
			, .data_in(data_in), .data_out(data_out));			

MEMWB memwb(.sel_wb_out(sel_wb_reg2_out), .reg_rw_out(reg_rw_reg2_out), .addr_dst_out(addr_dst_reg2_out), .alu_result_out(alu_result_reg_out)
			, .data_out_out(data_out_out), .alu_result_in(alu_result_out), .sel_wb_in(sel_wb_reg_out), .reg_rw_in(reg_rw_reg_out)
			, .addr_dst_in(addr_dst_reg_out), .data_out_in(data_out), .clk(clk), .rst(rst));	

Forward forwarding(.forwardA(forwardA), .forwardB(forwardB), .addr2_out(addr2_out), .addr1_out(addr1_out), .addr_dst_reg_out(addr_dst_reg_out)
					, .addr_dst_reg2_out(addr_dst_reg2_out), .reg_rw_out_exe(reg_rw_reg_out)
					, .reg_rw_out_mem(reg_rw_reg2_out), .data_rw_reg_out(data_rw_reg_out), .sel_data_in(sel_data_in)
					, .addr_dst(addr_dst), .addr1(addr1), .branch_ena(branch_ena), .sel_data1(sel_data1), .sel_data3(sel_data3), .addr_dst_out(addr_dst_out)
					, .addr2(addr2), .sel_data2_in(sel_data2_in), .sel_data1_in(sel_data1_in));
					
detection detect(.stall(stall), .ena_data_out(ena_data_out), .addr_dst_out(addr_dst_out), .addr1(addr1), .addr2(addr2));

endmodule
