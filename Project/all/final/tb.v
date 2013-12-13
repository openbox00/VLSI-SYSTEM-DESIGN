`timescale 1ns/10ps

`define CYCLE 20

module cpu_tb;
reg  clk, rst;

CPU cpu(.clk(clk), .rst(rst));

integer i;

initial
begin
	clk = 0;
	rst = 1;		
	/*
	#(`CYCLE*22)//*5) 
		for(i=0; i<32; i=i+1)
			$display("R[%d]:\t%d", i, cpu.reg_file.regs[i]);
	$stop;*/
end

initial
begin
	#(`CYCLE*420) 
		for(i=18'b111111111001100000; i<32'b111111111001110000; i=i+1)
			$display("R[%d]:\t%d", i, cpu.data_mem.data[i]);

end

/*
always @ (posedge clk)
begin
	if(cpu.ctrl.opcode==6'd37)
			$display("R[%d]:\t%d", 1, 123);
end
*/

always #(`CYCLE/2) clk = !clk;

initial
begin
	#`CYCLE rst = 0;
	#`CYCLE rst = 1;
		
	
  	#(`CYCLE*500) $finish;
end

initial
begin
	$readmemb("Fibo.prog", cpu.inst_mem.inst);
	
end

//initial $sdf_annotate ("ok.sdf",cpu);

initial begin
$dumpfile("top.vcd");
$dumpvars;
end

endmodule
