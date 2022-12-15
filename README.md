# Signal Transition Detector (STD)

This repo contains all source files and scripts needed to build ASIC design of STD based on reference Simulink-model. STD is based on FIR filter of folded architecture. Input/output word length is 12 bits.

Repo is organized as set of two folders:
1. **Source** - contains files:
	- *SigTransDetect.v* - behavioral level description;
	- *SigTransDetect_TB.v* - testbench for behavioral level and for netlist after synthesis;
	- *SigTransDetect_layout_TB.v* - testbench for netlist after layout;
	- *Din.txt* - file containing input data;
	- *Dout.txt* - file containing reference output data.
2. **Scripts** - contains files:
	- *STD.sdc* - constraint file for synthesis and layout stages;
	- *X_FAB_typ.tcl*, *X_FAB_slow.tcl*, *X_FAB_fast.tcl* - files containing paths to technology library of digital cells in different PVT corners;
	- *STD.tcl* - script for synthesis flow;
	- *STD_pins* - I/O assignment file;
	- *MMMC.tcl* - file for a corner description;
	- *STD_PaR.tcl* - script for layout flow.

<u>**To build project you should**</u>:
1. Clone repo into your working folder (e.g. **Digital_ASIC**);
2. Create folders **Incisive**, **RTL_Compiler** and **Encounter**;
3. Run Cadence Incisive from **Incisive** folder and then compile and elaborate project using *SigTransDetect.v* as source file and *SigTransDetect_TB.v* as testbench file;
4. Open Terminal in **RTL_Compiler** folder and enter the command **"RTL_Compiler ../Scripts/STD.tcl"**;
5. As in step 3, simulate gate level model using *SigTransDetect_synth.v* (**Outputs** folder) as source file and *SigTransDetect_TB.v* as testbench file;
6. Open Terminal in **Encounter** folder and enter the command **"Encounter ../Scripts/STD_PaR.tcl"**;
7. As in step 3, simulate netlist after layout using *SigTransDetect_logic.v* (**Outputs** folder) as source file and *SigTransDetect_layout_TB.v* as testbench file.

> The main design stages here are 4 and 6 (synthesis and layout). Stages 3, 5 and 7 are used for verification.

8. Project is built. By this moment you have folders:
	- **Source**
	- **Scripts**
	- **Incisive**
	- **RTL_Compiler**
	- **Encounter**
	- **Reports** (contains text files with timing reports after both synthesis and layout design stages);
	- **Outputs** (contains netlist, .sdc, .def, .sdf files generated after both synthesis and layout design stages).
