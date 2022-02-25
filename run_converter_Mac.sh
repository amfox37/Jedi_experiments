#!/bin/bash

IODA_BUILD_DIR=/Users/afox/Jedi/ioda_internal/build
echo "IODA build directory = "${IODA_BUILD_DIR}

export PYTHONPATH=/Users/afox/Jedi/ioda_internal/build/lib/python3.9/pyioda/ioda/../
Python3_EXECUTABLE=/usr/local/Frameworks/Python.framework/Versions/3.9/bin/python3.9

OBS_FILE=/Users/afox/Jedi/Jedi_experiments/OWP_obs/2020/202003/wdb0_obs_swe_snwd_target_2020030100_p24h_m24h_max_sep_6h_test02_elevation_filled.csv

SWE_OUT_FILE=/Users/afox/Jedi/Jedi_experiments/OWP_obs/2020/202003/owp_swe_2020030100.nc
DEPTH_OUT_FILE=/Users/afox/Jedi/Jedi_experiments/OWP_obs/2020/202003/owp_depth_2020030100.nc

${Python3_EXECUTABLE} ${IODA_BUILD_DIR}/bin/owp_snow_obs.py -i ${OBS_FILE} -o ${SWE_OUT_FILE} --thin_depth 1
${Python3_EXECUTABLE} ${IODA_BUILD_DIR}/bin/owp_snow_obs.py -i ${OBS_FILE} -o ${DEPTH_OUT_FILE} --thin_swe 1