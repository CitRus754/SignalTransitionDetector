### Project Name:		"Signal Transition Detector"
### Author:			"R.A. Citaishvili"
### Technology:			"X-FAB 180nm CMOS, XT018 1143"
### Library:			"D_CELLS_HD, 1.8V"
### Tools:			"Cadence RTL Compiler, Cadence Encounter"
###
### Stage:			"Synthesis, Layout"
### File description:		"Design constraints"
###
### Work directory:		-
### Run command:		-

set EXTCLK "clk";
set_units -time 1.0ns;

set_units -capacitance 1.0pF;
set EXTCLK_PERIOD 40.0;

create_clock -name "$EXTCLK" -period "$EXTCLK_PERIOD" -waveform "0 [expr $EXTCLK_PERIOD/2]" [get_ports clk]

set SKEW 0.200

set_clock_uncertainty $SKEW [get_clocks $EXTCLK]

set MINRISE 0.20
set MAXRISE 0.25
set MINFALL 0.20
set MAXFALL 0.25

set_clock_transition -rise -min $MINRISE [get_clocks $EXTCLK]
set_clock_transition -rise -max $MAXRISE [get_clocks $EXTCLK]
set_clock_transition -fall -min $MINFALL [get_clocks $EXTCLK]
set_clock_transition -fall -max $MAXFALL [get_clocks $EXTCLK]

set_max_capacitance 0.5 [all_outputs]

################FALSE PATH SECTION####################

set_ideal_network [get_ports {reset}]
set_false_path -from [get_ports {reset}]

