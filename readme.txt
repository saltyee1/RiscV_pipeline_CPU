chip: Files required for layout.
rtl: Verilog circuit files.
sim: Various testbench files.
syn: Files generated from circuit synthesis.
syn_result: Additional files generated from circuit synthesis including report.txt.
testprog: Assembly language files.
wave: Waveform files.
workspace: General area for performing synthesis, superlint, etc.

you can cd to workspace and then use the following insturcion to test circute

please remember to cd to workspace

1. pre sim
ncverilog ../sim/testbench_total.v +access+r +define+fibo
ncverilog ../sim/testbench_total.v +access+r +define+sort
ncverilog ../sim/testbench_total.v +access+r +define+basic 
ncverilog ../sim/testbench_total.v +access+r +define+total (need 20 minutes up (include a 2^12 loop))

Because the file testbench_total.v contains test data for the fast multiplier,due to the design,
we have attempted to perform a 12-bit test using a method of continuously adding 1.This will 
take a relatively longer time.

2. post syn (original Top_syn.v is for 30 ns)
ncverilog ../sim/testbench_total.v +access+r +define+fibo+syn
ncverilog ../sim/testbench_total.v +access+r +define+sort+syn
ncverilog ../sim/testbench_total.v +access+r +define+basic+syn
ncverilog ../sim/testbench_total.v +access+r +define+total+syn (need 20 minutes up (include a 2^12 loop))