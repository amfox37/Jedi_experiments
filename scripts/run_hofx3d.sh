#!/bin/bash

JEDI_BUILD_DIR=/glade/u/home/afox/work/jedi/wrf_hydro_nwm_jedi/build
echo "JEDI build directory = "${JEDI_BUILD_DIR}

# Define JEDI bin directory where the executables are found
export jedibin=${JEDI_BUILD_DIR}/bin

$jedibin/wrf_hydro_nwm_jedi_hofx3d.x config/hofx3d_colorado.yaml logs/nwm_jedi.log
