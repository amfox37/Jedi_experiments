#!/bin/bash

IODA_BUILD_DIR=/Users/afox/Jedi/ioda_internal/build
echo "IODA build directory = "${IODA_BUILD_DIR}

export PYTHONPATH=/Users/afox/Jedi/ioda_internal/build/lib/python3.9/pyioda/ioda/../
Python3_EXECUTABLE=/usr/local/Frameworks/Python.framework/Versions/3.9/bin/python3.9

OBS_DIR=/Users/afox/Jedi/Jedi_experiments/Single_obs

OBS_FILE=${OBS_DIR}/wdb0_obs_swe_snwd_target_2021030112_p3h_m3h_max_sep_6h_colorado_v2.csv

OBS_DIR_OUT=/Users/afox/Jedi/Jedi_experiments/input/obs
echo "Obs out directory = "${OBS_DIR_OUT}

SWE_OUT_FILE=${OBS_DIR_OUT}/owp_swe_2021030112_colorado_v2.nc
DEPTH_OUT_FILE=${OBS_DIR_OUT}/owp_depth_2021030112_colorado_v2.nc

${Python3_EXECUTABLE} ${IODA_BUILD_DIR}/bin/owp_snow_obs.py -i ${OBS_FILE} -o ${SWE_OUT_FILE} --thin_depth 1 --err_fn swe_err
${Python3_EXECUTABLE} ${IODA_BUILD_DIR}/bin/owp_snow_obs.py -i ${OBS_FILE} -o ${DEPTH_OUT_FILE} --thin_swe 1 --err_fn depth_err   