#!/bin/bash

IODA_BUILD_DIR=/glade/u/home/afox/work/jedi/ioda_internal/build
echo "IODA build directory = "${IODA_BUILD_DIR}

export PYTHONPATH=/glade/u/home/afox/work/jedi/ioda_internal/build/lib/python3.7/pyioda/ioda/../
Python3_EXECUTABLE=/glade/u/apps/ch/opt/python/3.7.9/gnu/9.1.0/bin/python3.7

YR=2021
MN=05

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

  OBS_FILE=/glade/u/home/afox/work/jedi/Jedi_experiments/OWP_obs/2021/${YR}${MN}/wdb0_obs_swe_snwd_target_${YR}${MN}${DY}12_p3h_m3h_max_sep_6h.csv

  SWE_OUT_FILE=/glade/u/home/afox/work/jedi/Jedi_experiments/OWP_obs/2021/${YR}${MN}/owp_swe_${YR}-${MN}-${DY}T00:00:00Z.nc
  DEPTH_OUT_FILE=/glade/u/home/afox/work/jedi/Jedi_experiments/OWP_obs/2021/${YR}${MN}/owp_depth_${YR}-${MN}-${DY}T00:00:00Z.nc

  ${Python3_EXECUTABLE} ${IODA_BUILD_DIR}/bin/owp_snow_obs.py -i ${OBS_FILE} -o ${SWE_OUT_FILE} --thin_depth 1 --err_fn swe_err
  ${Python3_EXECUTABLE} ${IODA_BUILD_DIR}/bin/owp_snow_obs.py -i ${OBS_FILE} -o ${DEPTH_OUT_FILE} --thin_swe 1 --err_fn depth_err
done
