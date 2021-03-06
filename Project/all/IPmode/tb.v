`timescale 1ns/10ps

`define CYCLE 20

module cpu_tb;
reg  clk, rst;

CPU cpu(.clk(clk), .rst(rst));

integer i;

initial
begin
	clk = 0;
	rst = 0;		
	/*
	#(`CYCLE*22)//*5) 
		for(i=0; i<32; i=i+1)
			$display("R[%d]:\t%d", i, cpu.reg_file.regs[i]);
	$stop;*/
end

always #(`CYCLE/2) clk = !clk;

initial
begin
	#`CYCLE rst = 1;
	#`CYCLE rst = 0;	
	
  	#(`CYCLE*500) $finish;
end

initial
begin:prog_load
	$readmemh("main.prog", cpu_tb.cpu.inst_mem.inst);
end

initial
begin:in_load
 #80	$readmemh("in.dat", cpu_tb.cpu.data_mem.data);
end



//initial $sdf_annotate ("ok.sdf",cpu);

initial begin
$dumpfile("top.vcd");
$dumpvars;
end

endmodule
