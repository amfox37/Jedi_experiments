#!/bin/bash

JEDI_BUILD_DIR=/glade/u/home/afox/work/jedi/wrf_hydro_nwm_jedi/build
echo "JEDI build directory = "${JEDI_BUILD_DIR}

# Define JEDI bin directory where the executables are found
export jedibin=${JEDI_BUILD_DIR}/bin


rm output/3dvar/analysis_r100h500_500_obs_swe.nc
cp input/wrf_hydro_nwm_files/RESTART.2020030100_DOMAIN1 output/3dvar/analysis_r100h500_500_obs_swe.nc

$jedibin/wrf_hydro_nwm_jedi_var.x config/3dvar_owp_B99.yaml logs/r100h500_swe.log
