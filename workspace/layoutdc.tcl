##############################################

#	Read in top module

##############################################
read_file -format verilog {./trafficlight.v}
current_design trafficlight
link

##############################################

#	Set the clock rate

##############################################

create_clock -name "CLK" -period 10 -waveform { 5 10 }  { clk  }
set_dont_touch_network  [ find clock CLK ]
set_fix_hold  [ find clock CLK]

##############################################

#       Set Design Environment 

##############################################

set_operating_condition -max slow -max_library slow\
                        -min fast -min_library fast
                        
set_wire_load_model -name tsmc18_wl10 -library slow
set_max_area 3000
set_clock_latency 2 CLK
set_clock_uncertainty -setup 0.1 CLK
set_drive 0.001339 [all_inputs]
set_load 0.001339 [all_outputs]
set_input_delay -clock CLK -max 0.4 [all_inputs] 

set_output_delay -clock CLK -max 0.4 [all_outputs]


set_fix_multiple_port_nets -all -buffer_constants

##############################################

#       Synthesize circuit

##############################################

compile -exact_map 
#compile -exact_map -map_effort high -area_effort high -power_effort high

change_names -rule verilog -verbose -hierarchy

##############################################

#       Create Report

##############################################

report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group > ../synthesis/report/timing_max_rpt.txt
report_timing -path full -delay min -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group > ../synthesis/report/timing_min_rpt.txt
report_area -nosplit > ../synthesis/report/area_rpt.txt
report_power -analysis_effort low > ../synthesis/report/power_rpt.txt


##############################################

#       Save syntheized file

##############################################

write -hierarchy -format verilog -output {../synthesis/trafficlight_syn.v}
write_sdf -version 1.0 -context verilog {../synthesis/trafficlight_syn.sdf}
write_sdc -version 1.5 {../synthesis/trafficlight_syn.sdc}
write_script > {../synthesis/trafficlight_syn.dc}


#exit
