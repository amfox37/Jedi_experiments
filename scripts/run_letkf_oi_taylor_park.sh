#!/bin/bash

JEDI_BUILD_DIR=/glade/u/home/afox/work/jedi/wrf_hydro_nwm_jedi/build
EXPT=taylor_park
R_DATE=2019030101
H_DATE=2019-03-01_01:00
O_DATE=2019-03-01T00:00:00

echo "JEDI build directory = "${JEDI_BUILD_DIR}

# Define JEDI bin directory where the executables are found
export jedibin=${JEDI_BUILD_DIR}/bin

rm ./output/letkf/${EXPT}/*

cp ./input/wrf_hydro_nwm_files/${EXPT}/RESTART.${R_DATE}_DOMAIN1 ./output/letkf/${EXPT}/letkf.lsm.ens.0.${O_DATE}Z.PT1H
cp ./input/wrf_hydro_nwm_files/${EXPT}/RESTART.${R_DATE}_DOMAIN1 ./output/letkf/${EXPT}/letkf_inc.lsm.ens.0.${O_DATE}Z.PT1H
cp ./input/wrf_hydro_nwm_files/${EXPT}/HYDRO_RST.${H_DATE}_DOMAIN1 ./output/letkf/${EXPT}/letkf.hyd.ens.0.${O_DATE}Z.PT1H
cp ./input/wrf_hydro_nwm_files/${EXPT}/HYDRO_RST.${H_DATE}_DOMAIN1 ./output/letkf/${EXPT}/letkf_inc.hyd.ens.0.${O_DATE}Z.PT1H

$jedibin/wrf_hydro_nwm_jedi_letkf.x config/letkf_oi_${EXPT}.yaml logs/nwm_jedi.log
