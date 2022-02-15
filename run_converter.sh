#!/bin/bash

IODA_BUILD_DIR=/glade/u/home/afox/work/jedi/ioda/build
echo "IODA build directory = "${IODA_BUILD_DIR}

PYTHONPATH=/glade/u/home/afox/work/jedi/ioda/build/lib/python3.7/pyioda/ioda/../:/glade/work/jedipara/cheyenne/opt/modules/gnu-10.1.0/bufr/noaa-emc-11.5.0/lib/python3.7/site-packages
Python3_EXECUTABLE=/glade/u/apps/ch/opt/python/3.7.9/gnu/9.1.0/pkg-library/20201220/bin/python3.7

OBS_FILE=/glade/u/home/afox/work/jedi/OWP_obs/2021/202101/wdb0_obs_swe_snwd_target_2021010112_p3h_m3h_max_sep_6h.csv

SWE_OUT_FILE=./owp_swe_out.nc
DEPTH_OUT_FILE=./owp_depth_out.nc

${Python3_EXECUTABLE} ${IODA_BUILD_DIR}/bin/owp_snow_obs.py -i ${OBS_FILE} -o ${SWE_OUT_FILE} --thin_depth 1
${Python3_EXECUTABLE} ${IODA_BUILD_DIR}/bin/owp_snow_obs.py -i ${OBS_FILE} -o ${DEPTH_OUT_FILE} --thin_swe 1
 
