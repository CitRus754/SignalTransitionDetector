### Project Name:		"Signal Transition Detector"
### Author:			"R.A. Citaishvili"
### Technology:			"X-FAB 180nm CMOS, XT018 1143"
### Library:			"D_CELLS_HD, 1.8V"
### Tools:			"Cadence Encounter"
###
### Stage:			"Layout"
### File description:		"Layout flow script"
###
### Work directory:		Digital_ASIC/Encounter
### Run command:		"Encounter ../Scripts/STD_PaR.tcl"

#------------------Design Import-------------------#
set init_gnd_net VSS
set init_lef_file {/Cadence/Libs/X_FAB/XKIT/xt018/cadence/v5_0/techLEF/v5_0_2/xt018_xx43_HD_MET4_METMID_METTHK.lef /Cadence/Libs/X_FAB/XKIT/xt018/diglibs/D_CELLS_HD/v4_0/LEF/v4_0_0/xt018_D_CELLS_HD.lef  /Cadence/Libs/X_FAB/XKIT/xt018/diglibs/D_CELLS_HD/v4_0/LEF/v4_0_0/xt018_xx43_MET4_METMID_METTHK_D_CELLS_HD_mprobe.lef}
set init_design_settop 0
set init_verilog ../Outputs/SigTransDetect_synth.v
set init_mmmc_file ../Scripts/MMMC.tcl
set init_io_file ../Scripts/STD_pins
set init_pwr_net VDD
init_design
win
#--------------Floorplanning-------------#
floorPlan -site core_hd -s 300.16 300.16 20.16 20.16 20.16 20.16
floorPlan -coreMarginsBy die -site core_hd -s 300 300 20 20 20 20

#----------------Powerplanning----------------#
clearGlobalNets
globalNetConnect VDD -type pgpin -pin vdd -inst * -module {}
globalNetConnect VDD -type tiehi -pin vdd -inst * -module {}
globalNetConnect VDD -type tielo -pin vdd -inst * -module {}
globalNetConnect VSS -type tielo -pin gnd -inst * -module {}
globalNetConnect VSS -type tiehi -pin gnd -inst * -module {}
globalNetConnect VSS -type pgpin -pin gnd -inst * -module {}
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer METTPL -type core_rings -jog_distance 2.8 -threshold 2.8 -nets {VDD VSS} -follow core -stacked_via_bottom_layer MET1 -layer {bottom MET1 top MET1 right MET2 left MET2} -width 3 -spacing 0.6 -offset 3.15
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit MET3 -max_same_layer_jog_length 6 -padcore_ring_bottom_layer_limit MET1 -set_to_set_distance 60 -skip_via_on_pin Standardcell -stacked_via_top_layer METTPL -padcore_ring_top_layer_limit MET3 -spacing 2.5 -merge_stripes_value 2.8 -layer MET2 -block_ring_bottom_layer_limit MET1 -width 3 -nets {VSS VDD} -stacked_via_bottom_layer MET1

selectWire 20.1600 10.4100 23.1600 330.0700 2 VSS # Delete unnecessary VSS stripe
deleteSelectedFromFPlan
selectWire 25.6600 14.0100 28.6600 326.4700 2 VDD # Delete unnecessary VDD stripe
deleteSelectedFromFPlan

sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { MET1 METTPL } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { MET1 METTPL } -nets { VDD VSS } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { MET1 METTPL }
editPowerVia -skip_via_on_pin Standardcell -bottom_layer MET1 -add_vias 1 -top_layer METTPL
set sprEpvLayers {}

#-------------------------Placement----------------------------------#

redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -prePlace -idealClock -pathReports -drvReports -slackReports -numPaths 50 -prefix STD_prePlace -outDir ../Reports/Layout/Timing_prePlace
setPlaceMode -fp false
placeDesign -inPlaceOpt

#---------------------Clock-Tree Synthesis--------------------------------#
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -preCTS -idealClock -pathReports -drvReports -slackReports -numPaths 50 -prefix STD_preCTS_s -outDir ../Reports/Layout/Timing_preCTS_setup
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -preCTS -hold -idealClock -pathReports -slackReports -numPaths 50 -prefix STD_preCTS_h -outDir ../Reports/Layout/Timing_preCTS_hold
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -preCTS
createClockTreeSpec -bufferList {BUHDX0 BUHDX1 BUHDX12 BUHDX2 BUHDX3 BUHDX4 BUHDX6 BUHDX8 DLY1HDX0 DLY1HDX1 DLY2HDX0 DLY2HDX1 DLY4HDX0 DLY4HDX1 DLY8HDX0 DLY8HDX1 INHDX0 INHDX1 INHDX12 INHDX2 INHDX3 INHDX4 INHDX6 INHDX8 STEHDX0 STEHDX1 STEHDX2 STEHDX4} -file Clock.ctstch
setCTSMode -engine ck
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS

#-------------------------Routing---------------------------------#
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix STD_postCTS_s -outDir ../Reports/Layout/Timing_postCTS_setup
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postCTS -hold -pathReports -slackReports -numPaths 50 -prefix STD_postCTS_h -outDir ../Reports/Layout/Timing_postCTS_hold
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -postCTS
optDesign -postCTS -hold
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail

#--------------------------Final Steps and Verify---------------------------------#
setAnalysisMode -analysisType onChipVariation -skew true -clockPropagation sdcControl
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix STD_postRoute_s -outDir ../Reports/Layout/Timing_postRoute_setup
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -hold -pathReports -slackReports -numPaths 50 -prefix STD_postRoute_h -outDir ../Reports/Layout/Timing_postRoute_hold
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -postRoute
optDesign -postRoute -hold
getFillerMode -quiet
addFiller -cell FEED7HD FEED10HD FEED15HD FEED1HD FEED25HD FEED2HD FEED3HD FEED5HD -prefix FILLER
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
verify_drc -report SigTransDetect.drc.rpt -limit 1000
verifyConnectivity -type all -error 1000 -warning 50
setExtractRCMode -engine postRoute -effortLevel signoff
extractRC

#------------------------Sign-Off and Generation Files-----------------------------------#
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -signoff -pathReports -drvReports -slackReports -numPaths 50 -prefix STD_signOff_s -outDir ../Reports/Layout/Timing_SignOff_setup
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -signoff -hold -pathReports -slackReports -numPaths 50 -prefix STD_signOff_h -outDir ../Reports/Layout/Timing_SignOff_hold
all_hold_analysis_views 
all_setup_analysis_views 
write_sdf -view TYPview ../Outputs/SigTransDetect.sdf
saveNetlist ../Outputs/SigTransDetect_logic.v
saveNetlist ../Outputs/SigTransDetect_phys.v -includePhysicalCell {FEED7HD FEED10HD FEED15HD FEED1HD FEED25HD FEED2HD FEED3HD FEED5HD}
global dbgLefDefOutVersion
set dbgLefDefOutVersion 5.8
defOut -floorplan -netlist -routing ../Outputs/SigTransDetect.def

