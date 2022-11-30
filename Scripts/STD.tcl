### Project Name:		"Signal Transition Detector"
### Author:			"R.A. Citaishvili"
### Technology:			"X-FAB 180nm CMOS, XT018 1143"
### Library:			"D_CELLS_HD, 1.8V"
### Tools:			"Cadence RTL Compiler 14.27"
###
### Stage:			"Synthesis"
### File description:		"Script with main commands for synthesis"
###
### Work directory:		Digital_ASIC/RTL_Compiler
### Run command:		"RTL_Compiler ../Scripts/STD.tcl"

## Setup technology files
include ../Scripts/X_FAB_typ.tcl
#include ../Scripts/X_FAB_slow.tcl
#include ../Scripts/X_FAB_fast.tcl

# Setup variables
set DESIGN SigTransDetect
set PARAMS {}

## Read in Verilog HDL files
# Main module
read_hdl -v2001 ../Source/SigTransDetect.v

## Compile our code
elaborate -parameters $PARAMS $DESIGN

## Setup design constraints
read_sdc ../Scripts/STD.sdc

## Synthesize our schematic
synthesize -to_mapped
synthesize -incremental

## Write out area and timing reports
report timing > ../Reports/Synthesis/STD_synth_timing_report
report area > ../Reports/Synthesis/STD_synth_area_report

## Write out netlist
write_hdl -mapped > ../Outputs/SigTransDetect_synth.v

## Write out SDC file
write_sdc > ../Outputs/STD_syn.sdc

gui_show

