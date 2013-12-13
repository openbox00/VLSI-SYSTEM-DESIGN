srcSourceCodeView
srcResizeWindow 1 27 1270 945
debImport "/home/user1/vsd10f/vsd10f23/n26991784/alu/ALU.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784/alu/tb_alu.v" -path \
          {/home/user1/vsd10f/vsd10f23/n26991784/alu}
wvCreateWindow
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvResizeWindow -win $_nWave2 1 27 1270 945
wvConvertFile -win $_nWave2 -o \
           "/home/user1/vsd10f/vsd10f23/n26991784/alu/alu.vcd.fsdb" \
           "/home/user1/vsd10f/vsd10f23/n26991784/alu/alu.vcd"
wvOpenFile -win $_nWave2 {/home/user1/vsd10f/vsd10f23/n26991784/alu/alu.vcd.fsdb}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/t_alu"
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/t_alu/opcode[5:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 )}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/t_alu/opcode[5:0]} \
{/t_alu/sub_opcode[4:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 2 )}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/t_alu/opcode[5:0]} \
{/t_alu/sub_opcode[4:0]} \
{/t_alu/enable_execute} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 3 )}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/t_alu/opcode[5:0]} \
{/t_alu/sub_opcode[4:0]} \
{/t_alu/enable_execute} \
{/t_alu/reset} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 4 )}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/t_alu/opcode[5:0]} \
{/t_alu/sub_opcode[4:0]} \
{/t_alu/enable_execute} \
{/t_alu/reset} \
{/t_alu/alu_overflow} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 5 )}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/t_alu/opcode[5:0]} \
{/t_alu/sub_opcode[4:0]} \
{/t_alu/enable_execute} \
{/t_alu/reset} \
{/t_alu/alu_overflow} \
{/t_alu/alu_result[31:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 6 )}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/t_alu/opcode[5:0]} \
{/t_alu/sub_opcode[4:0]} \
{/t_alu/enable_execute} \
{/t_alu/reset} \
{/t_alu/alu_overflow} \
{/t_alu/alu_result[31:0]} \
{/t_alu/scr1[31:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 7 )}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/t_alu/opcode[5:0]} \
{/t_alu/sub_opcode[4:0]} \
{/t_alu/enable_execute} \
{/t_alu/reset} \
{/t_alu/alu_overflow} \
{/t_alu/alu_result[31:0]} \
{/t_alu/scr1[31:0]} \
{/t_alu/scr2[31:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 8 )}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/t_alu/opcode[5:0]} \
{/t_alu/sub_opcode[4:0]} \
{/t_alu/enable_execute} \
{/t_alu/reset} \
{/t_alu/alu_overflow} \
{/t_alu/alu_result[31:0]} \
{/t_alu/scr1[31:0]} \
{/t_alu/scr2[31:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 8 )}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvGetSignalClose -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
debExit
