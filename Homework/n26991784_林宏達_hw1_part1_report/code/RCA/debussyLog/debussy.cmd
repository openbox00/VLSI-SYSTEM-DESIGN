srcSourceCodeView
srcResizeWindow -4 27 1280 949
debImport "/home/user1/vsd10f/vsd10f23/n26991784/RCA/rca.v" \
          "/home/user1/vsd10f/vsd10f23/n26991784/RCA/tb_rca.v" -path \
          {/home/user1/vsd10f/vsd10f23/n26991784/RCA}
wvCreateWindow
wvResizeWindow -win $_nWave2 50 214 960 332
wvResizeWindow -win $_nWave2 50 214 960 332
wvConvertFile -win $_nWave2 -o \
           "/home/user1/vsd10f/vsd10f23/n26991784/RCA/rca.vcd.fsdb" \
           "/home/user1/vsd10f/vsd10f23/n26991784/RCA/rca.vcd"
wvOpenFile -win $_nWave2 {/home/user1/vsd10f/vsd10f23/n26991784/RCA/rca.vcd.fsdb}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvResizeWindow -win $_nWave2 -4 27 1280 949
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/t_Add_4bitRCA"
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group  {"G1" \
{/t_Add_4bitRCA/a[3:0]} \
{/t_Add_4bitRCA/addsub} \
{/t_Add_4bitRCA/b[3:0]} \
{/t_Add_4bitRCA/cout} \
{/t_Add_4bitRCA/ovudsign} \
{/t_Add_4bitRCA/sum[3:0]} \
}
wvAddSignal -win $_nWave2 -group  {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 )}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvGetSignalClose -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 )}
wvSetRadix -win $_nWave2 -format UDec
wvSetRadix -win $_nWave2 -2Com
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
wvCreateWindow
wvResizeWindow -win $_nWave3 50 214 960 332
wvResizeWindow -win $_nWave3 50 214 960 332
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/t_Add_4bitRCA"
wvSetPosition -win $_nWave3 {("G1" 6)}
wvSetPosition -win $_nWave3 {("G1" 6)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group  {"G1" \
{/t_Add_4bitRCA/a[3:0]} \
{/t_Add_4bitRCA/addsub} \
{/t_Add_4bitRCA/b[3:0]} \
{/t_Add_4bitRCA/cout} \
{/t_Add_4bitRCA/ovudunsign} \
{/t_Add_4bitRCA/sum[3:0]} \
}
wvAddSignal -win $_nWave3 -group  {"G2" \
}
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 6 )}
wvSetPosition -win $_nWave3 {("G1" 6)}
wvGetSignalClose -win $_nWave3
wvResizeWindow -win $_nWave3 -4 27 1280 949
wvZoomAll -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 6 )}
wvSetRadix -win $_nWave3 -format UDec
wvSetRadix -win $_nWave3 -Unsigned
wvGetSignalClose -win $_nWave3
wvCloseWindow -win $_nWave3
debExit
