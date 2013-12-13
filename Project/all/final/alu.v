`timescale 1ns/10ps

module ALU(ls_w_mode, funct, sv, source1, source2, over_flow, alu_result);
input [3:0] funct;
input ls_w_mode;
input [1:0] sv;
input [31:0] source1, source2;

output reg over_flow;
output reg [31:0] alu_result;


`define NOP 	4'd0
`define ADD 	4'd1
`define SUB 	4'd2
`define AND 	4'd3
`define OR 		4'd4
`define XOR 	4'd5
`define SRLI 	4'd6
`define SLLI 	4'd7
`define ROTRI 	4'd8
`define LSW		4'd9
`define	SLT		4'd10
`define SUBRI	4'd11
`define	MUL		4'd12



wire [31:0] offset = source2 << ((ls_w_mode)?sv:2);
wire [63:0] rotate_tmp = {source1, source1} >> source2;
wire [63:0] alu_temp = source1 * source2;
always@(funct, offset, source1, source2, rotate_tmp, alu_temp)
begin
		case(funct)
			`ADD: begin
				
				alu_result = source1 + source2;
				if((!source1[31] && !source2[31] && alu_result[31]) || 
					(source1[31] && source2[31] && !alu_result[31])) 
					over_flow = 1;
				else over_flow = 0;
				end
			`SUB: begin
				
				alu_result = source1 - source2;
				if((!source1[31] && source2[31] && alu_result[31]) || 
					(source1[31] && !source2[31] && !alu_result[31])) 
					over_flow = 1;
				else over_flow = 0;
			end
			`AND: begin
				
				alu_result = source1 & source2;
				over_flow = 0;
			end
			`OR: begin
				alu_result = source1 | source2;
				over_flow = 0;
			end
			`XOR: begin
				
				alu_result = source1 ^ source2;
				over_flow = 0;
			end
			`SRLI: begin
				
				alu_result = source1 >> source2;
				over_flow = 0;
			end
			`ROTRI: begin
				
				alu_result =  rotate_tmp[31:0];
				over_flow = 0;
			end
			`SLLI: begin
				
				alu_result = source1 << source2;
				over_flow = 0;
			end	
			`LSW: begin
				
				alu_result = source1 + offset;
				over_flow = 0;
			end
			`SLT: begin///
				if (source1[31]==1 && source2[31]==0) begin
				alu_result = 32'd1;
				over_flow = 0;
				end
				else if (source1[31]==0 && source2[31]==1) begin
				alu_result = 32'd0;
				over_flow = 0;
				end
				else if ( source1[31]==0 && source2[31]==0) begin
						if (source1[30:0]<source2[31:0]) begin
							alu_result = 32'd1;
							over_flow = 0;
						end
						else begin
						alu_result = 32'd0;
						over_flow = 0;
						end
				end
				else  begin
						if (source1[30:0]>source2[31:0]) begin
							alu_result = 32'd1;
							over_flow = 0;
							end
							else begin
							alu_result = 32'd0;
							over_flow = 0;
							end
				end
				
			end
			`SUBRI: begin
			
				alu_result = source2 - source1;
				if((!source1[31] && source2[31] && alu_result[31]) || 
					(source1[31] && !source2[31] && !alu_result[31])) 
					over_flow = 1;
				else over_flow = 0;
			end
			`MUL: begin
				
				alu_result = alu_temp[31:0];
				over_flow =  |alu_temp[63:32];
			end
			default: begin
				alu_result = source1 >> 1'd0;
				over_flow = 0;
			end				
		endcase
	
end

endmodule
