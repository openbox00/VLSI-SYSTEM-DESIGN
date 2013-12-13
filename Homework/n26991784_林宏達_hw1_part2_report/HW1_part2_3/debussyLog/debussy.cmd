srcSourceCodeView
srcResizeWindow -4 27 1280 949
debImport "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_3/alu.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_3/imm_reg_select.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_3/mux2to1_select.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_3/mux5to1_select.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_3/register.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_3/sign_extend.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_3/tb_top_module.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_3/top_module.v" \
          -path {/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_3}
wvCreateWindow
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvResizeWindow -win $_nWave2 1 27 1270 945
wvConvertFile -win $_nWave2 -o \
           "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_3/top.vcd.fsdb" \
           "/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_3/top.vcd"
wvOpenFile -win $_nWave2 \
           {/home/user1/vsd10f/vsd10f23/n26991784_hw1_part2/HW1_part2_3/top.vcd.fsdb}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_top_module"
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module/reset_reg} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 )}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module/reset_reg} \
{/tb_top_module/opcode[5:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 2 )}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module/reset_reg} \
{/tb_top_module/opcode[5:0]} \
{/tb_top_module/sub_opcode[4:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 3 )}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module/reset_reg} \
{/tb_top_module/opcode[5:0]} \
{/tb_top_module/sub_opcode[4:0]} \
{/tb_top_module/clk} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 4 )}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module/reset_reg} \
{/tb_top_module/opcode[5:0]} \
{/tb_top_module/sub_opcode[4:0]} \
{/tb_top_module/clk} \
{/tb_top_module/alu_overflow} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 5 )}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module/reset_reg} \
{/tb_top_module/opcode[5:0]} \
{/tb_top_module/sub_opcode[4:0]} \
{/tb_top_module/clk} \
{/tb_top_module/alu_overflow} \
{/tb_top_module/read} \
{/tb_top_module/read_address1[4:0]} \
{/tb_top_module/read_address2[4:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 )}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module/reset_reg} \
{/tb_top_module/opcode[5:0]} \
{/tb_top_module/sub_opcode[4:0]} \
{/tb_top_module/clk} \
{/tb_top_module/alu_overflow} \
{/tb_top_module/read} \
{/tb_top_module/read_address1[4:0]} \
{/tb_top_module/read_address2[4:0]} \
{/tb_top_module/alu1[31:0]} \
{/tb_top_module/alu2[31:0]} \
{/tb_top_module/alu_result[31:0]} \
{/tb_top_module/enable_execute} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 9 10 11 12 )}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module/reset_reg} \
{/tb_top_module/opcode[5:0]} \
{/tb_top_module/sub_opcode[4:0]} \
{/tb_top_module/clk} \
{/tb_top_module/alu_overflow} \
{/tb_top_module/read} \
{/tb_top_module/read_address1[4:0]} \
{/tb_top_module/read_address2[4:0]} \
{/tb_top_module/alu1[31:0]} \
{/tb_top_module/alu2[31:0]} \
{/tb_top_module/alu_result[31:0]} \
{/tb_top_module/enable_execute} \
{/tb_top_module/imm_reg_select} \
{/tb_top_module/mux2to1_select} \
{/tb_top_module/mux5to1_select[2:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 13 14 15 )}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module/reset_reg} \
{/tb_top_module/opcode[5:0]} \
{/tb_top_module/sub_opcode[4:0]} \
{/tb_top_module/clk} \
{/tb_top_module/alu_overflow} \
{/tb_top_module/read} \
{/tb_top_module/read_address1[4:0]} \
{/tb_top_module/read_address2[4:0]} \
{/tb_top_module/alu1[31:0]} \
{/tb_top_module/alu2[31:0]} \
{/tb_top_module/alu_result[31:0]} \
{/tb_top_module/enable_execute} \
{/tb_top_module/imm_reg_select} \
{/tb_top_module/mux2to1_select} \
{/tb_top_module/mux5to1_select[2:0]} \
{/tb_top_module/R1[31:0]} \
{/tb_top_module/R2[31:0]} \
{/tb_top_module/R3[31:0]} \
{/tb_top_module/immediate[19:0]} \
{/tb_top_module/write} \
{/tb_top_module/write_address[4:0]} \
{/tb_top_module/write_data[31:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 16 17 18 19 20 21 22 )}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/tb_top_module/reset_reg} \
{/tb_top_module/opcode[5:0]} \
{/tb_top_module/sub_opcode[4:0]} \
{/tb_top_module/clk} \
{/tb_top_module/alu_overflow} \
{/tb_top_module/read} \
{/tb_top_module/read_address1[4:0]} \
{/tb_top_module/read_address2[4:0]} \
{/tb_top_module/alu1[31:0]} \
{/tb_top_module/alu2[31:0]} \
{/tb_top_module/alu_result[31:0]} \
{/tb_top_module/enable_execute} \
{/tb_top_module/imm_reg_select} \
{/tb_top_module/mux2to1_select} \
{/tb_top_module/mux5to1_select[2:0]} \
{/tb_top_module/R1[31:0]} \
{/tb_top_module/R2[31:0]} \
{/tb_top_module/R3[31:0]} \
{/tb_top_module/immediate[19:0]} \
{/tb_top_module/write} \
{/tb_top_module/write_address[4:0]} \
{/tb_top_module/write_data[31:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 16 17 18 19 20 21 22 )}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvGetSignalClose -win $_nWave2
wvZoomAll -win $_nWave2
wvResizeWindow -win $_nWave2 1 27 1270 945
wvSetCursor -win $_nWave2 10152.483133 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 14930.122255 -snap {("G1" 19)}
wvSetCursor -win $_nWave2 19807.295525 -snap {("G1" 19)}
wvSetCursor -win $_nWave2 30059.312807 -snap {("G1" 20)}
wvSetCursor -win $_nWave2 39813.659347 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 39415.522753 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 50264.744925 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 10152.483133 -snap {("G1" 13)}
wvSetCursor -win $_nWave2 19906.829673 -snap {("G1" 19)}
wvSetCursor -win $_nWave2 11844.563656 -snap {("G1" 20)}
wvSetCursor -win $_nWave2 19807.295525 -snap {("G1" 17)}
wvSetCursor -win $_nWave2 19608.227228 -snap {("G1" 19)}
wvSetCursor -win $_nWave2 30158.846955 -snap {("G1" 13)}
wvSetCursor -win $_nWave2 40510.398385 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 47378.254622 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 40012.727643 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 50065.676628 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 40211.795940 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 31054.654290 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 29959.778658 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 30059.312807 -snap {("G1" 13)}
wvSetCursor -win $_nWave2 50364.279073 -snap {("G1" 14)}
wvSetCursor -win $_nWave2 55141.918195 -snap {("G1" 16)}
wvSetCursor -win $_nWave2 66787.413554 -snap {("G1" 18)}
wvSetCursor -win $_nWave2 60417.228058 -snap {("G1" 4)}
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
debExit
