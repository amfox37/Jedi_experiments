#!/bin/bash

JEDI_BUILD_DIR=/glade/u/home/afox/work/jedi/whj_test/build
echo "JEDI build directory = "${JEDI_BUILD_DIR}

# Define JEDI bin directory where the executables are found
export jedibin=${JEDI_BUILD_DIR}/bin


rm output/3dvar/analysis.nc
cp input/wrf_hydro_nwm_files/RESTART.2017010100_sneqv_plus5_DOMAIN1_3dvar_input output/3dvar/analysis.nc

$jedibin/wrf_hydro_nwm_jedi_var.x config/3dvar_single_obs.yaml logs/single_obs_swe.log
