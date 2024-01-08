##############################################

#	Read in top module

##############################################
read_file -format verilog {../rtl/Top.v}
current_design Top
link

##############################################

#	Set the clock rate

##############################################

create_clock -name "clk" -period 50.0 -waveform { 25.0  50.0  }  { clk  }
set_dont_touch_network  [ find clock clk ]
set_fix_hold  [ find clock clk]

##############################################

#       Set Design Environment 

##############################################

set_operating_condition -max slow -max_library slow\
                        -min fast -min_library fast
set_clock_latency 2 clk
set_drive [drive_of "slow/DFFX1/Q"] [all_inputs]
set_load [load_of "slow/DFFX1/D"] [all_outputs]
set_input_delay -clock clk -max 1 [remove_from_collection [all_inputs] [get_ports clk]]
set_input_delay -clock clk -min 0.2 [remove_from_collection [all_inputs] [get_ports clk]]
set_output_delay -clock clk -max 1 [all_outputs]
set_output_delay -clock clk -min 0.1 [all_outputs]

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

report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group > ../syn/timing_max_rpt50.txt
report_timing -path full -delay min -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group > ../syn/timing_min_rpt50.txt
report_area -nosplit > ../syn/area_rpt50.txt
report_power -analysis_effort low > ../syn/power_rpt50.txt


##############################################

#       Save syntheized file

##############################################

write -hierarchy -format verilog -output {../syn/Top_syn.v}
write_sdf -version 1.0 -context verilog {../syn/Top_syn.sdf}
write_sdc -version 1.5 {../syn/Top_syn.sdc}
write_script > {../syn/Top_syn.dc}


#exit
