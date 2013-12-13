module CPU(clk, rst_n);
input 	clk, rst_n;
reg  	[31:0] 	wb_data, reg_alu_in, reg_alu_result;
reg		[4:0]	pc;

wire 	[4:0] 	addr1, addr2, addr_dst;
wire 	[31:0] 	inst, read_data1, read_data2, 
				ext_out, alu_result,
				mem_in, alu_in,	mem_out;
wire 	[5:0] 	opcode;
wire 	[4:0] 	sub_op;
wire 	fetch_ena, reg_rw,  sel_alu_in, 
		sign_ena, alu_ena, ls_w_mode, over_flow;
wire	[1:0] sel_wb, sel_ext;
wire	[3:0] funct;
		
assign {opcode, addr_dst, addr1, addr2} = inst[30:10];
assign sub_op = inst[4:0];


always@(posedge clk)
begin
	if(!rst_n) pc <= 5'd0;
	else if(fetch_ena) pc <= pc + 5'd1;
end

always@(posedge clk)
begin
	if(!rst_n) begin
		reg_alu_in <= 32'd0;
		reg_alu_result <= 32'd0;
	end
	else if(alu_ena) begin
		reg_alu_in <= alu_in;
		reg_alu_result <= alu_result;
	end
end

always@(sel_wb, reg_alu_in, reg_alu_result, mem_out)
begin
	case(sel_wb)
		2'd0:	wb_data = reg_alu_in;
		2'd1:	wb_data = mem_out;
		default:wb_data = reg_alu_result;
	endcase
end

assign alu_in = (sel_alu_in)? ext_out:read_data2;

INST_MEM inst_mem(.clk(clk), .rst_n(rst_n), .addr(pc), 
                  .fetch_ena(fetch_ena), .inst_out(inst));
				  
REGISTER_FILE reg_file(.clk(clk), .rst_n(rst_n), .rw_ena(reg_rw), .addr1(addr1),
						.addr2(addr2), .addr_dst(addr_dst),	.write_data(wb_data),
						.read_data1(read_data1), .read_data2(read_data2),
						.read_data3(mem_in));

CONTROLLER ctrl(.clk(clk), .rst_n(rst_n), .opcode(opcode), 
				.sub_op(sub_op), .fetch_ena(fetch_ena), .reg_rw(reg_rw), 
				.funct(funct), .sel_alu_in(sel_alu_in), .sel_wb(sel_wb), .sel_ext(sel_ext),
				.ls_w_mode(ls_w_mode), .sign_ena(sign_ena), .alu_ena(alu_ena));
				

EXTENSION ext(.sign_ena(sign_ena), .sel(sel_ext), .imm_field(inst[19:0]), 
			  .ext_out(ext_out));	

ALU alu(.ls_w_mode(ls_w_mode), .funct(funct), .sv(inst[9:8]),
		.alu_ena(alu_ena), .source1(read_data1), .source2(alu_in),
		.over_flow(over_flow), .alu_result(alu_result));			  


endmodule
