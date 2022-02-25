#!/bin/bash

JEDI_BUILD_DIR=/Users/afox/Jedi/wrf_hydro_internal/build
echo "JEDI build directory = "${JEDI_BUILD_DIR}

# Define JEDI bin directory where the executables are found
export jedibin=${JEDI_BUILD_DIR}/bin

rm ./output/letkf/conus_swe/*
cp ./input/wrf_hydro_nwm_files/RESTART.2020030100_DOMAIN1 ./output/letkf/conus_swe/letkf.lsm.ens.0.2020-03-01T00:00:00Z.PT0S
cp ./input/wrf_hydro_nwm_files/RESTART.2020030100_DOMAIN1 ./output/letkf/conus_swe/letkf_inc.lsm.ens.0.2020-03-01T00:00:00Z.PT0S
cp ./input/wrf_hydro_nwm_files/HYDRO_RST.2020-03-01_00:00_DOMAIN1 ./output/letkf/conus_swe/letkf.hyd.ens.0.2020-03-01T00:00:00Z.PT0S
cp ./input/wrf_hydro_nwm_files/HYDRO_RST.2020-03-01_00:00_DOMAIN1 ./output/letkf/conus_swe/letkf_inc.hyd.ens.0.2020-03-01T00:00:00Z.PT0S

$jedibin/wrf_hydro_nwm_jedi_letkf.x config/letkf_soar_conus_swe.yaml logs/nwm_jedi.log