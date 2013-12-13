`define CYCLE 100

module cpu_tb;
reg  clk, rst_n;

CPU cpu(.clk(clk), .rst_n(rst_n));

integer i;

initial
begin
	clk = 0;
	rst_n = 1;		
	
	#(`CYCLE*22*5) 
		for(i=0; i<32; i=i+1)
			$display("R[%d]:\t%d", i, cpu.reg_file.regs[i]);
	$stop;
end

always #(`CYCLE/2) clk = !clk;

initial
begin
	#`CYCLE rst_n = 0;
	#`CYCLE rst_n = 1;	
end

initial
begin:prog_load
	$readmemb("mins.prog", cpu.inst_mem.inst);
end

initial begin
$dumpfile("top.vcd");
$dumpvars;
end
endmodule 


