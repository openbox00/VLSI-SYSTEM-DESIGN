srcSourceCodeView
srcResizeWindow 5 27 804 500
debImport "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_4/alu.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_4/buffer.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_4/controller.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_4/imm_reg_select.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_4/mux2to1_select.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_4/mux5to1_select.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_4/register.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_4/sign_extend.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_4/tb_top_controller_module.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_4/top_controller_module.v" \
          -path {/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_4}
wvCreateWindow
wvResizeWindow -win $_nWave2 50 214 960 332
wvResizeWindow -win $_nWave2 50 214 960 332
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvConvertFile -win $_nWave2 -o \
           "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_4/top.vcd.fsdb" \
           "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_4/top.vcd"
wvOpenFile -win $_nWave2 \
           {/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_4/top.vcd.fsdb}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_top_module_controller"
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module_controller/clk} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 )}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module_controller/clk} \
{/tb_top_module_controller/reset} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 2 )}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module_controller/clk} \
{/tb_top_module_controller/reset} \
{/tb_top_module_controller/alu_overflow} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 3 )}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module_controller/clk} \
{/tb_top_module_controller/reset} \
{/tb_top_module_controller/alu_overflow} \
{/tb_top_module_controller/ir[31:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 4 )}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvGetSignalSetScope -win $_nWave2 "/tb_top_module_controller/tb/alu_m1"
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module_controller/clk} \
{/tb_top_module_controller/reset} \
{/tb_top_module_controller/alu_overflow} \
{/tb_top_module_controller/ir[31:0]} \
{/tb_top_module_controller/tb/alu_m1/opcode[5:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 5 )}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module_controller/clk} \
{/tb_top_module_controller/reset} \
{/tb_top_module_controller/alu_overflow} \
{/tb_top_module_controller/ir[31:0]} \
{/tb_top_module_controller/tb/alu_m1/opcode[5:0]} \
{/tb_top_module_controller/tb/alu_m1/src2[31:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 6 )}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvGetSignalClose -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module_controller/clk} \
{/tb_top_module_controller/reset} \
{/tb_top_module_controller/alu_overflow} \
{/tb_top_module_controller/ir[31:0]} \
{/tb_top_module_controller/tb/alu_m1/opcode[5:0]} \
{/tb_top_module_controller/tb/alu_m1/sub_opcode[4:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 6 )}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module_controller/clk} \
{/tb_top_module_controller/reset} \
{/tb_top_module_controller/alu_overflow} \
{/tb_top_module_controller/ir[31:0]} \
{/tb_top_module_controller/tb/alu_m1/opcode[5:0]} \
{/tb_top_module_controller/tb/alu_m1/sub_opcode[4:0]} \
{/tb_top_module_controller/tb/alu_m1/read_data1[31:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 7 )}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module_controller/clk} \
{/tb_top_module_controller/reset} \
{/tb_top_module_controller/alu_overflow} \
{/tb_top_module_controller/ir[31:0]} \
{/tb_top_module_controller/tb/alu_m1/opcode[5:0]} \
{/tb_top_module_controller/tb/alu_m1/sub_opcode[4:0]} \
{/tb_top_module_controller/tb/alu_m1/read_data1[31:0]} \
{/tb_top_module_controller/tb/alu_m1/src2[31:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 8 )}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module_controller/clk} \
{/tb_top_module_controller/reset} \
{/tb_top_module_controller/alu_overflow} \
{/tb_top_module_controller/ir[31:0]} \
{/tb_top_module_controller/tb/alu_m1/opcode[5:0]} \
{/tb_top_module_controller/tb/alu_m1/sub_opcode[4:0]} \
{/tb_top_module_controller/tb/alu_m1/read_data1[31:0]} \
{/tb_top_module_controller/tb/alu_m1/src2[31:0]} \
{/tb_top_module_controller/tb/alu_m1/alu_result[31:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 9 )}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module_controller/clk} \
{/tb_top_module_controller/reset} \
{/tb_top_module_controller/alu_overflow} \
{/tb_top_module_controller/ir[31:0]} \
{/tb_top_module_controller/tb/alu_m1/opcode[5:0]} \
{/tb_top_module_controller/tb/alu_m1/sub_opcode[4:0]} \
{/tb_top_module_controller/tb/alu_m1/read_data1[31:0]} \
{/tb_top_module_controller/tb/alu_m1/src2[31:0]} \
{/tb_top_module_controller/tb/alu_m1/alu_result[31:0]} \
{/tb_top_module_controller/tb/alu_m1/enable_execute} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 10 )}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvGetSignalSetScope -win $_nWave2 "/tb_top_module_controller/tb/register"
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module_controller/clk} \
{/tb_top_module_controller/reset} \
{/tb_top_module_controller/alu_overflow} \
{/tb_top_module_controller/ir[31:0]} \
{/tb_top_module_controller/tb/alu_m1/opcode[5:0]} \
{/tb_top_module_controller/tb/alu_m1/sub_opcode[4:0]} \
{/tb_top_module_controller/tb/alu_m1/read_data1[31:0]} \
{/tb_top_module_controller/tb/alu_m1/src2[31:0]} \
{/tb_top_module_controller/tb/alu_m1/alu_result[31:0]} \
{/tb_top_module_controller/tb/alu_m1/enable_execute} \
{/tb_top_module_controller/tb/register/read} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 11 )}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module_controller/clk} \
{/tb_top_module_controller/reset} \
{/tb_top_module_controller/alu_overflow} \
{/tb_top_module_controller/ir[31:0]} \
{/tb_top_module_controller/tb/alu_m1/opcode[5:0]} \
{/tb_top_module_controller/tb/alu_m1/sub_opcode[4:0]} \
{/tb_top_module_controller/tb/alu_m1/read_data1[31:0]} \
{/tb_top_module_controller/tb/alu_m1/src2[31:0]} \
{/tb_top_module_controller/tb/alu_m1/alu_result[31:0]} \
{/tb_top_module_controller/tb/alu_m1/enable_execute} \
{/tb_top_module_controller/tb/register/read} \
{/tb_top_module_controller/tb/register/read_address1[4:0]} \
{/tb_top_module_controller/tb/register/read_address2[4:0]} \
{/tb_top_module_controller/tb/register/read_data1[31:0]} \
{/tb_top_module_controller/tb/register/read_data2[31:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 12 13 14 15 )}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module_controller/clk} \
{/tb_top_module_controller/reset} \
{/tb_top_module_controller/alu_overflow} \
{/tb_top_module_controller/ir[31:0]} \
{/tb_top_module_controller/tb/alu_m1/opcode[5:0]} \
{/tb_top_module_controller/tb/alu_m1/sub_opcode[4:0]} \
{/tb_top_module_controller/tb/alu_m1/read_data1[31:0]} \
{/tb_top_module_controller/tb/alu_m1/src2[31:0]} \
{/tb_top_module_controller/tb/alu_m1/alu_result[31:0]} \
{/tb_top_module_controller/tb/alu_m1/enable_execute} \
{/tb_top_module_controller/tb/register/read} \
{/tb_top_module_controller/tb/register/read_address1[4:0]} \
{/tb_top_module_controller/tb/register/read_address2[4:0]} \
{/tb_top_module_controller/tb/register/read_data1[31:0]} \
{/tb_top_module_controller/tb/register/read_data2[31:0]} \
{/tb_top_module_controller/tb/register/write} \
{/tb_top_module_controller/tb/register/write_address[4:0]} \
{/tb_top_module_controller/tb/register/write_data[31:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 16 17 18 )}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module_controller/clk} \
{/tb_top_module_controller/reset} \
{/tb_top_module_controller/alu_overflow} \
{/tb_top_module_controller/ir[31:0]} \
{/tb_top_module_controller/tb/alu_m1/opcode[5:0]} \
{/tb_top_module_controller/tb/alu_m1/sub_opcode[4:0]} \
{/tb_top_module_controller/tb/alu_m1/read_data1[31:0]} \
{/tb_top_module_controller/tb/alu_m1/src2[31:0]} \
{/tb_top_module_controller/tb/alu_m1/alu_result[31:0]} \
{/tb_top_module_controller/tb/alu_m1/enable_execute} \
{/tb_top_module_controller/tb/register/read} \
{/tb_top_module_controller/tb/register/read_address1[4:0]} \
{/tb_top_module_controller/tb/register/read_address2[4:0]} \
{/tb_top_module_controller/tb/register/read_data1[31:0]} \
{/tb_top_module_controller/tb/register/read_data2[31:0]} \
{/tb_top_module_controller/tb/register/write} \
{/tb_top_module_controller/tb/register/write_address[4:0]} \
{/tb_top_module_controller/tb/register/write_data[31:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 16 17 18 )}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvGetSignalClose -win $_nWave2
wvZoomAll -win $_nWave2
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvZoomAll -win $_nWave2
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvSelectGroup -win $_nWave2 {G2}
wvSetCursor -win $_nWave2 544172.380020 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 113418.217434 -snap {("G1" 10)}
wvSetCursor -win $_nWave2 91674.828599 -snap {("G1" 15)}
wvSetCursor -win $_nWave2 177473.065622 -snap {("G1" 13)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_top_module_controller/tb/register"
wvGetSignalSetScope -win $_nWave2 "/tb_top_module_controller/tb/sign"
wvGetSignalSetScope -win $_nWave2 "/tb_top_module_controller/tb/register"
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module_controller/clk} \
{/tb_top_module_controller/reset} \
{/tb_top_module_controller/alu_overflow} \
{/tb_top_module_controller/ir[31:0]} \
{/tb_top_module_controller/tb/alu_m1/opcode[5:0]} \
{/tb_top_module_controller/tb/alu_m1/sub_opcode[4:0]} \
{/tb_top_module_controller/tb/alu_m1/read_data1[31:0]} \
{/tb_top_module_controller/tb/alu_m1/src2[31:0]} \
{/tb_top_module_controller/tb/alu_m1/alu_result[31:0]} \
{/tb_top_module_controller/tb/alu_m1/enable_execute} \
{/tb_top_module_controller/tb/register/read} \
{/tb_top_module_controller/tb/register/read_address1[4:0]} \
{/tb_top_module_controller/tb/register/read_address2[4:0]} \
{/tb_top_module_controller/tb/register/read_data1[31:0]} \
{/tb_top_module_controller/tb/register/read_data2[31:0]} \
{/tb_top_module_controller/tb/register/write} \
{/tb_top_module_controller/tb/register/write_address[4:0]} \
{/tb_top_module_controller/tb/register/write_data[31:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 37610.186092 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 54652.301665 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 64642.507346 -snap {("G1" 10)}
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvSelectGroup -win $_nWave2 {G2}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_top_module_controller/tb/imm_reg"
wvGetSignalSetScope -win $_nWave2 "/tb_top_module_controller/tb/mux2to1"
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module_controller/clk} \
{/tb_top_module_controller/reset} \
{/tb_top_module_controller/alu_overflow} \
{/tb_top_module_controller/ir[31:0]} \
{/tb_top_module_controller/tb/alu_m1/opcode[5:0]} \
{/tb_top_module_controller/tb/alu_m1/sub_opcode[4:0]} \
{/tb_top_module_controller/tb/alu_m1/read_data1[31:0]} \
{/tb_top_module_controller/tb/alu_m1/src2[31:0]} \
{/tb_top_module_controller/tb/alu_m1/alu_result[31:0]} \
{/tb_top_module_controller/tb/alu_m1/enable_execute} \
{/tb_top_module_controller/tb/register/read} \
{/tb_top_module_controller/tb/register/read_address1[4:0]} \
{/tb_top_module_controller/tb/register/read_address2[4:0]} \
{/tb_top_module_controller/tb/register/read_data1[31:0]} \
{/tb_top_module_controller/tb/register/read_data2[31:0]} \
{/tb_top_module_controller/tb/register/write} \
{/tb_top_module_controller/tb/register/write_address[4:0]} \
{/tb_top_module_controller/tb/register/write_data[31:0]} \
{/tb_top_module_controller/tb/mux2to1/alu_result[31:0]} \
{/tb_top_module_controller/tb/mux2to1/src2[31:0]} \
{/tb_top_module_controller/tb/mux2to1/write_data[31:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 19 20 21 )}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 49373.191900 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 63479.818157 -snap {("G1" 10)}
wvSetCursor -win $_nWave2 46434.311429 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 64067.594251 -snap {("G1" 10)}
wvSetCursor -win $_nWave2 76998.668320 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 86403.085824 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 95219.727235 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 83464.205354 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 97570.831611 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 82876.429260 -snap {("G1" 11)}
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 95833.333333 -snap {("G1" 18)}
wvSetCursor -win $_nWave2 79761.904762 -snap {("G1" 17)}
wvSetCursor -win $_nWave2 61904.761905 -snap {("G1" 15)}
wvSetCursor -win $_nWave2 59523.809524 -snap {("G1" 10)}
wvSelectSignal -win $_nWave2 {( "G1" 21 )}
wvSelectSignal -win $_nWave2 {( "G1" 19 20 21 )}
wvSelectSignal -win $_nWave2 {( "G1" 19 20 21 )}
wvSetRadix -win $_nWave2 -format Bin
wvSetCursor -win $_nWave2 60119.047619 -snap {("G1" 21)}
wvSetCursor -win $_nWave2 54761.904762 -snap {("G1" 19)}
wvSetCursor -win $_nWave2 64285.714286 -snap {("G1" 18)}
wvSelectSignal -win $_nWave2 {( "G1" 18 )}
wvSelectSignal -win $_nWave2 {( "G1" 18 )}
wvSetRadix -win $_nWave2 -format Bin
wvSetCursor -win $_nWave2 98214.285714 -snap {("G1" 18)}
wvSetCursor -win $_nWave2 94047.619048 -snap {("G1" 18)}
wvSetCursor -win $_nWave2 95238.095238 -snap {("G1" 19)}
wvSetCursor -win $_nWave2 104761.904762 -snap {("G1" 18)}
wvSetCursor -win $_nWave2 134523.809524 -snap {("G1" 19)}
wvSetCursor -win $_nWave2 145238.095238 -snap {("G1" 18)}
wvSetCursor -win $_nWave2 136904.761905 -snap {("G1" 18)}
wvSetCursor -win $_nWave2 133333.333333 -snap {("G1" 20)}
wvSetCursor -win $_nWave2 144642.857143 -snap {("G1" 19)}
wvSelectSignal -win $_nWave2 {( "G1" 7 )}
wvSelectSignal -win $_nWave2 {( "G1" 7 )}
wvSetRadix -win $_nWave2 -format Bin
wvSetCursor -win $_nWave2 186309.523810 -snap {("G1" 19)}
wvSetCursor -win $_nWave2 213095.238095 -snap {("G1" 19)}
wvSetCursor -win $_nWave2 512500.000000 -snap {("G1" 17)}
wvSetCursor -win $_nWave2 523809.523810 -snap {("G1" 17)}
wvSetCursor -win $_nWave2 478571.428571 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 317261.904762 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 517261.904762 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 342857.142857 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 73214.285714 -snap {("G1" 15)}
wvSetCursor -win $_nWave2 62500.000000 -snap {("G1" 15)}
wvSetCursor -win $_nWave2 66666.666667 -snap {("G1" 16)}
wvSetCursor -win $_nWave2 54761.904762 -snap {("G1" 16)}
wvSetCursor -win $_nWave2 51190.476190 -snap {("G1" 20)}
wvSetCursor -win $_nWave2 64285.714286 -snap {("G1" 20)}
wvSetCursor -win $_nWave2 157142.857143 -snap {("G2" 0)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 65178.571429 -snap {("G1" 14)}
wvSetCursor -win $_nWave2 63244.047619 -snap {("G1" 14)}
wvSetCursor -win $_nWave2 59970.238095 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 64880.952381 -snap {("G1" 20)}
wvSetCursor -win $_nWave2 57589.285714 -snap {("G1" 20)}
wvSetCursor -win $_nWave2 65625.000000 -snap {("G1" 16)}
wvSetCursor -win $_nWave2 94642.857143 -snap {("G1" 15)}
wvSetCursor -win $_nWave2 105803.571429 -snap {("G1" 15)}
wvSetCursor -win $_nWave2 135119.047619 -snap {("G1" 14)}
wvSetCursor -win $_nWave2 145833.333333 -snap {("G1" 14)}
wvSetCursor -win $_nWave2 175148.809524 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 174851.190476 -snap {("G1" 13)}
wvSetCursor -win $_nWave2 175297.619048 -snap {("G1" 14)}
wvSetCursor -win $_nWave2 184672.619048 -snap {("G1" 15)}
wvSetCursor -win $_nWave2 214821.428571 -snap {("G1" 10)}
wvSetCursor -win $_nWave2 225089.285714 -snap {("G1" 16)}
wvSetCursor -win $_nWave2 254583.333333 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 264553.571428 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 265446.428571 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 264702.380952 -snap {("G1" 15)}
wvSetCursor -win $_nWave2 294910.714286 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 305029.761905 -snap {("G1" 10)}
wvSetCursor -win $_nWave2 334821.428571 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 345089.285714 -snap {("G1" 13)}
wvSetCursor -win $_nWave2 345089.285714 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 344940.476190 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 345089.285714 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 345238.095238 -snap {("G1" 16)}
wvSetCursor -win $_nWave2 374702.380952 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 384821.428571 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 384672.619048 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 385416.666667 -snap {("G1" 16)}
wvSetCursor -win $_nWave2 414851.190476 -snap {("G1" 10)}
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvSetCursor -win $_nWave2 425213.078878 -snap {("G1" 13)}
wvZoom -win $_nWave2 424765.154367 425213.078878
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 425265.426682 -snap {("G1" 12)}
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 424989.116623 -snap {("G1" 18)}
wvSetCursor -win $_nWave2 414765.644421 -snap {("G1" 14)}
wvSetCursor -win $_nWave2 425127.271652 -snap {("G1" 17)}
wvSetCursor -win $_nWave2 424712.806563 -snap {("G1" 16)}
wvSetCursor -win $_nWave2 454623.370506 -snap {("G1" 13)}
wvSetCursor -win $_nWave2 454899.680565 -snap {("G1" 11)}
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvSetCursor -win $_nWave2 464886.937969 -snap {("G1" 16)}
wvSetCursor -win $_nWave2 494643.017502 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 505071.421301 -snap {("G1" 16)}
wvSetCursor -win $_nWave2 534689.741207 -snap {("G1" 11)}
wvZoomAll -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
debExit
