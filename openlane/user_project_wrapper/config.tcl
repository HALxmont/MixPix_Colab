# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

# Base Configurations. Don't Touch
# section begin

set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

# YOU ARE NOT ALLOWED TO CHANGE ANY VARIABLES DEFINED IN THE FIXED WRAPPER CFGS 
source $::env(DESIGN_DIR)/fixed_dont_change/fixed_wrapper_cfgs.tcl

# YOU CAN CHANGE ANY VARIABLES DEFINED IN THE DEFAULT WRAPPER CFGS BY OVERRIDING THEM IN THIS CONFIG.TCL
source $::env(DESIGN_DIR)/fixed_dont_change/default_wrapper_cfgs.tcl

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) user_project_wrapper
#section end

# User Configurations

## Source Verilog Files
set ::env(VERILOG_FILES) "\
	/content/MixPix_Colab/defines.v \
	/content/MixPix_Colab/rtl/user_project_wrapper.v"

## Clock configurations
set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET) "wb_clk_i"

set ::env(CLOCK_PERIOD) "10"

## Internal Macros
### Macro PDN Connections
set ::env(FP_PDN_MACRO_HOOKS) "\
	rlbp_macro0 vccd1 vssd1 vccd1 vssd1,\
	PD_M1_M2_macro0 vdda2 vssa1 VDD VSS, 
	sl_macro0 vssa1 vdda2 VSS Ibias,
	sl_macro0 vdda1 vssa1 VDD VSS"



### Macro Placement
set ::env(MACRO_PLACEMENT_CFG) /content/conda-env/share/openlane/designs/user_project_wrapper/macro.cfg

### Black-box verilog and views
set ::env(VERILOG_FILES_BLACKBOX) "\
	/content/MixPix_Colab/defines.v \
	/content/MixPix_Colab/openlane/rlbp/src/rlbp_macro.v \
	/content/MixPix_Colab/openlane/rlbp/src/rlbp.v \
	/content/MixPix_Colab/openlane/PD_M1_M2/src/PD_M1_M2.v \
	/content/MixPix_Colab/openlane/SystemLevel/src/SystemLevel.v"

set ::env(EXTRA_LEFS) "\
	/content/lef/rlbp_macro.lef \
	/content/lef/PD_M1_M2.lef \
	/content/lef/SystemLevel.lef "

set ::env(EXTRA_GDS_FILES) "\
	/content/gds/rlbp_macro.gds \
	/content/gds/PD_M1_M2.gds \
	/content/gds/SystemLevel.gds "
	


# set ::env(GLB_RT_MAXLAYER) 5
set ::env(RT_MAX_LAYER) {met4}




# disable pdn check nodes becuase it hangs with multiple power domains.
# any issue with pdn connections will be flagged with LVS so it is not a critical check.
set ::env(FP_PDN_CHECK_NODES) 0

# The following is because there are no std cells in the example wrapper project.
set ::env(SYNTH_ELABORATE_ONLY) 1
set ::env(PL_RANDOM_GLB_PLACEMENT) 1

set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_BUFFER_INPUT_PORTS) 0
set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0

set ::env(FP_PDN_ENABLE_RAILS) 0

set ::env(DIODE_INSERTION_STRATEGY) 0
set ::env(RUN_FILL_INSERTION) 0
set ::env(RUN_TAP_DECAP_INSERTION) 0
set ::env(CLOCK_TREE_SYNTH) 0



##custom configurations

set ::env(DRT_OPT_ITERS) 64
set ::env(ROUTING_CORES) 4

## Ignorar congesti??n
set ::env(GRT_ALLOW_CONGESTION) 1

# disable klayout because of https://github.com/hdl/conda-eda/issues/175
set ::env(RUN_KLAYOUT) 0

