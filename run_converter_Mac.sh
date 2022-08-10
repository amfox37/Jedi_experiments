#!/bin/bash

IODA_BUILD_DIR=/Users/afox/Jedi/ioda_internal/build
echo "IODA build directory = "${IODA_BUILD_DIR}

YR=2021
MN=03

i=1
while true; do
  if [[ "$i" -gt 31 ]]; then
       exit 1
  elif [[ "$i" -gt 9 ]]; then
  DY=$i
  else
  DY=0$i
  fi
  ((i++))
  echo ${DY}

export PYTHONPATH=/Users/afox/Jedi/ioda_internal/build/lib/python3.9/pyioda/ioda/../
Python3_EXECUTABLE=/usr/local/Frameworks/Python.framework/Versions/3.9/bin/python3.9

OBS_FILE=/Users/afox/Jedi/Jedi_experiments/OWP_obs/2021/${YR}${MN}/wdb0_obs_swe_snwd_target_${YR}${MN}${DY}12_p3h_m3h_max_sep_6h.csv

SWE_OUT_FILE=/Users/afox/Jedi/Jedi_experiments/OWP_obs/2021/${YR}${MN}/owp_swe_${YR}-${MN}-${DY}T00:00:00Z.nc
DEPTH_OUT_FILE=/Users/afox/Jedi/Jedi_experiments/OWP_obs/2021/${YR}${MN}/owp_depth_${YR}-${MN}-${DY}T00:00:00Z.nc

${Python3_EXECUTABLE} ${IODA_BUILD_DIR}/bin/owp_snow_obs.py -i ${OBS_FILE} -o ${SWE_OUT_FILE} --thin_depth 1 --err_fn swe_err
${Python3_EXECUTABLE} ${IODA_BUILD_DIR}/bin/owp_snow_obs.py -i ${OBS_FILE} -o ${DEPTH_OUT_FILE} --thin_swe 1 --err_fn depth_err

done