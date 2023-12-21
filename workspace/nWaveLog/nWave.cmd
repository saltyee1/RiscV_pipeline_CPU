wvConvertFile -win $_nWave1 -o \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd.fsdb" \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb_Top"
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top"
wvSetCursor -win $_nWave1 241.935715
wvSetCursor -win $_nWave1 93.932627
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd.fsdb" \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd"
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetCursor -win $_nWave1 134.978817
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd.fsdb" \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd"
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd.fsdb" \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd"
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb_Top/top/clk} \
{/tb_Top/top/current_pc\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd.fsdb" \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd"
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd.fsdb" \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd"
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd.fsdb" \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd"
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top/n_pcu"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb_Top/top/clk} \
{/tb_Top/top/current_pc\[31:0\]} \
{/tb_Top/top/n_pcu/current_pc\[31:0\]} \
{/tb_Top/top/n_pcu/nextpc\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb_Top"
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top"
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top/n_pcu"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb_Top/top/clk} \
{/tb_Top/top/current_pc\[31:0\]} \
{/tb_Top/top/n_pcu/current_pc\[31:0\]} \
{/tb_Top/top/n_pcu/nextpc\[31:0\]} \
{/tb_Top/top/n_pcu/em_type\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top/imm_ext"
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top/e_m_reg"
wvSetCursor -win $_nWave1 95.906001 -snap {("G1" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalSetScope -win $_nWave1 "/tb_Top"
wvGetSignalSetScope -win $_nWave1 "/tb_Top"
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top"
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top/n_pcu"
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd.fsdb" \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd"
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 196.942776 -snap {("G1" 3)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd.fsdb" \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd"
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd.fsdb" \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd"
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top"
wvSetCursor -win $_nWave1 252.591938
wvSetCursor -win $_nWave1 58.411886
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd.fsdb" \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd"
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
