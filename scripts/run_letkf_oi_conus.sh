#!/bin/bash

JEDI_BUILD_DIR=/glade/u/home/afox/work/jedi/wrf_hydro_nwm_jedi/build
echo "JEDI build directory = "${JEDI_BUILD_DIR}

# Define JEDI bin directory where the executables are found
export jedibin=${JEDI_BUILD_DIR}/bin

rm ./output/letkf/conus/*
cp ./input/wrf_hydro_nwm_files/conus/RESTART.2020030100_DOMAIN1 ./output/letkf/conus/letkf.lsm.ens.0.2020-03-01T00:00:00Z.PT0S
cp ./input/wrf_hydro_nwm_files/conus/RESTART.2020030100_DOMAIN1 ./output/letkf/conus/letkf_inc.lsm.ens.0.2020-03-01T00:00:00Z.PT0S
cp ./input/wrf_hydro_nwm_files/conus/HYDRO_RST.2020-03-01_00:00_DOMAIN1 ./output/letkf/conus/letkf.hyd.ens.0.2020-03-01T00:00:00Z.PT0S
cp ./input/wrf_hydro_nwm_files/conus/HYDRO_RST.2020-03-01_00:00_DOMAIN1 ./output/letkf/conus/letkf_inc.hyd.ens.0.2020-03-01T00:00:00Z.PT0S

$jedibin/wrf_hydro_nwm_jedi_letkf.x config/letkf_oi_conus.yaml logs/nwm_jedi.log
