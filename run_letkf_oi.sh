#!/bin/bash

JEDI_BUILD_DIR=/Users/afox/Jedi/wrf_hydro_internal/build
echo "JEDI build directory = "${JEDI_BUILD_DIR}

# Define JEDI bin directory where the executables are found
export jedibin=${JEDI_BUILD_DIR}/bin

rm ./output/letkf/single_obs/*

cp ./input/wrf_hydro_nwm_files/RESTART.2017010100_DOMAIN1 ./output/letkf/single_obs/letkf.lsm.ens.0.2017-01-01T00:00:00Z.PT0S
cp ./input/wrf_hydro_nwm_files/RESTART.2017010100_DOMAIN1 ./output/letkf/single_obs/letkf_inc.lsm.ens.0.2017-01-01T00:00:00Z.PT0S
cp ./input/wrf_hydro_nwm_files/HYDRO_RST.2017-01-01_00:00_DOMAIN1 ./output/letkf/single_obs/letkf.hyd.ens.0.2017-01-01T00:00:00Z.PT0S
cp ./input/wrf_hydro_nwm_files/HYDRO_RST.2017-01-01_00:00_DOMAIN1 ./output/letkf/single_obs/letkf_inc.hyd.ens.0.2017-01-01T00:00:00Z.PT0S

$jedibin/wrf_hydro_nwm_jedi_letkf.x config/letkf_oi.yaml logs/nwm_jedi.log