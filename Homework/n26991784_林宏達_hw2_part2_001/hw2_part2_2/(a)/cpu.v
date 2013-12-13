`timescale 1ns/10ps

module CPU(clk, rst_n);
input 	clk, rst_n;
reg  	[31:0] 	reg_alu, reg_alu_in2, wb_data; //reg_read_data1, reg_read_data2, reg_addr_dst,reg_mem_out,;
reg		[31:0]	pc;
reg		[31:0]	alu_in2,alu_in1;
reg		[31:0]	next_pc;


wire 	[4:0] 	addr1, addr2, addr_dst;
wire 	[31:0] 	inst, read_data1, read_data2, 
				ext_out, alu_result,
				mem_in, mem_out; 
wire 	[5:0] 	opcode;
wire 	[4:0] 	sub_op;
wire  	[1:0]	sel_alu_in1,sel_alu_in2,sel_wb;
wire 	fetch_ena, reg_rw, mem_ena, mem_rw,  
		sign_ena, alu_ena,branch_ena, ls_w_mode, over_flow, reg_alu_ena;
wire	[2:0]  sel_ext;
wire	[3:0] funct;
wire	[1:0] sel_pc;
		
assign {opcode, addr_dst, addr1, addr2} = inst[30:10];
assign sub_op = inst[4:0];


always@(posedge clk)
begin
	if(!rst_n) pc <= 32'd0;
	else if(fetch_ena || branch_ena) 
	pc <= next_pc;
end

always@(sel_pc,pc,reg_alu)
begin
	case(sel_pc)
		2'd1:	next_pc = (pc+32'd4);
		2'd0: 	next_pc = reg_alu;
		default: next_pc =pc;
	endcase
end

	

always@(posedge clk)
begin
	if(!rst_n) begin 
		reg_alu <= 32'd0;
		//reg_mem_out <= 32'd0;
		reg_alu_in2 <= 32'd0;
		//reg_read_data1 <= 32'd0;
		//reg_read_data2 <= 32'd0;
		//reg_addr_dst <= 32'd0;
	end
	else if(reg_alu_ena ==1 || mem_ena == 1 ) begin
		reg_alu <= alu_result;
		reg_alu_in2 <= alu_in2;
		//reg_mem_out <= mem_out; 
		//reg_read_data1 <= read_data1;
		//reg_read_data2 <= read_data2;
		//reg_addr_dst <= addr_dst;
	end
end




always@(sel_wb, reg_alu, reg_alu_in2, mem_out)
begin
	case(sel_wb)
		2'd0:	wb_data = reg_alu_in2;
		2'd1:	wb_data = mem_out;
		default:wb_data = reg_alu;
	endcase
end



always@(sel_alu_in1, pc, read_data1)
begin
	case(sel_alu_in1)
		2'd0:	alu_in1 = pc;
		2'd1:	alu_in1 = read_data1;
		default:alu_in1 = 1'd0;
	endcase
end

always@(sel_alu_in2, ext_out, read_data2, mem_in)
begin
	case(sel_alu_in2)
		2'd0:	alu_in2 = read_data2;
		2'd1:	alu_in2 = 32'd4;
		2'd2:	alu_in2 = ext_out;
		default:alu_in2 = mem_in;
	endcase
end


INST_MEM inst_mem(.clk(clk), .rst_n(rst_n), .addr({2'd0,pc[31:2]}), 
                  .fetch_ena(fetch_ena), .inst_out(inst));
				  
REGISTER_FILE reg_file(.clk(clk), .rst_n(rst_n), .rw_ena(reg_rw), .addr1(addr1),
						.addr2(addr2), .addr_dst(addr_dst),	.write_data(wb_data),
						.read_data1(read_data1), .read_data2(read_data2),
						.read_data3(mem_in));

CONTROLLER ctrl(.clk(clk), .rst_n(rst_n), .opcode(opcode), 
				.sub_op(sub_op), .fetch_ena(fetch_ena), .branch_ena(branch_ena), .reg_rw(reg_rw), 
				.funct(funct), .mem_ena(mem_ena), .mem_rw(mem_rw), .sel_alu_in1(sel_alu_in1),
				.sel_alu_in2(sel_alu_in2), .sel_wb(sel_wb), .sel_ext(sel_ext), .sel_pc(sel_pc),
				.ls_w_mode(ls_w_mode), .sign_ena(sign_ena), .alu_ena(alu_ena),
				.reg_alu_ena(reg_alu_ena), .alu_result(alu_result));

EXTENSION ext(.sign_ena(sign_ena), .sel(sel_ext), .imm_field(inst[23:0]), 
			  .ext_out(ext_out));	

ALU alu(.ls_w_mode(ls_w_mode), .funct(funct), .sv(inst[9:8]),
		.alu_ena(alu_ena), .source1(alu_in1), .source2(alu_in2),
		.over_flow(over_flow), .alu_result(alu_result));			  

DATA_MEM data_mem(.clk(clk), .rst_n(rst_n), .read_write(mem_rw),
				  .enable(mem_ena), .addr(reg_alu[6:0]), .data_in(mem_in),
				  .data_out(mem_out));		

endmodule
