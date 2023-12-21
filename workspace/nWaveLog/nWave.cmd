wvConvertFile -win $_nWave1 -o \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd.fsdb" \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb_Top"
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top"
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
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb_Top"
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top"
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top/hit_u"
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top/regfile"
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb_Top/top/clk} \
{/tb_Top/top/current_pc\[31:0\]} \
{/tb_Top/top/regfile/\\regFile\[11\] \[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb_Top/top/clk} \
{/tb_Top/top/current_pc\[31:0\]} \
{/tb_Top/top/regfile/\\regFile\[11\] \[31:0\]} \
{/tb_Top/top/branch_taken_reg_e_m} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb_Top/top/clk} \
{/tb_Top/top/current_pc\[31:0\]} \
{/tb_Top/top/regfile/\\regFile\[11\] \[31:0\]} \
{/tb_Top/top/branch_taken_reg_e_m} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvResizeWindow -win $_nWave1 0 23 1536 801
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb_Top/top/clk} \
{/tb_Top/top/current_pc\[31:0\]} \
{/tb_Top/top/regfile/\\regFile\[11\] \[31:0\]} \
{/tb_Top/top/branch_taken_reg_e_m} \
{/tb_Top/top/alu_src1\[31:0\]} \
{/tb_Top/top/alu_src2\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb_Top"
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top"
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top"
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top/regfile"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb_Top/top/clk} \
{/tb_Top/top/current_pc\[31:0\]} \
{/tb_Top/top/regfile/\\regFile\[11\] \[31:0\]} \
{/tb_Top/top/branch_taken_reg_e_m} \
{/tb_Top/top/alu_src1\[31:0\]} \
{/tb_Top/top/alu_src2\[31:0\]} \
{/tb_Top/top/regfile/\\regFile\[11\] \[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top/rs2_f"
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb_Top/top/clk} \
{/tb_Top/top/current_pc\[31:0\]} \
{/tb_Top/top/regfile/\\regFile\[11\] \[31:0\]} \
{/tb_Top/top/branch_taken_reg_e_m} \
{/tb_Top/top/alu_src1\[31:0\]} \
{/tb_Top/top/alu_src2\[31:0\]} \
{/tb_Top/top/regfile/\\regFile\[11\] \[31:0\]} \
{/tb_Top/top/rs2_f/in0\[31:0\]} \
{/tb_Top/top/rs2_f/in1\[31:0\]} \
{/tb_Top/top/rs2_f/in2\[31:0\]} \
{/tb_Top/top/rs2_f/in3\[31:0\]} \
{/tb_Top/top/rs2_f/result\[31:0\]} \
{/tb_Top/top/rs2_f/sel\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetCursor -win $_nWave1 252.254647 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 612.777881 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 839.360595 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd.fsdb" \
           "/home/CO2023/student_9/vlsi/pl_cpu/cpu/workspace/tb_Top.vcd"
wvReloadFile -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb_Top/top"
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb_Top/top/clk} \
{/tb_Top/top/current_pc\[31:0\]} \
{/tb_Top/top/regfile/\\regFile\[11\] \[31:0\]} \
{/tb_Top/top/branch_taken_reg_e_m} \
{/tb_Top/top/alu_src1\[31:0\]} \
{/tb_Top/top/alu_src2\[31:0\]} \
{/tb_Top/top/regfile/\\regFile\[11\] \[31:0\]} \
{/tb_Top/top/rs2_f/in0\[31:0\]} \
{/tb_Top/top/rs2_f/in1\[31:0\]} \
{/tb_Top/top/rs2_f/in2\[31:0\]} \
{/tb_Top/top/rs2_f/in3\[31:0\]} \
{/tb_Top/top/rs2_f/result\[31:0\]} \
{/tb_Top/top/rs2_f/sel\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/tb_Top/top/halt} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
