#!/bin/bash
#PBS -N 3dvar_exp
#PBS -A NRAL0017
#PBS -l walltime=02:30:00
#PBS -l select=1:ncpus=36:mpiprocs=6
#PBS -q regular
#PBS -j oe
#PBS -m abe
#PBS -M afox@ucar.edu

source /etc/profile.d/modules.sh
module purge
export JEDI_OPT=/glade/work/jedipara/cheyenne/opt/modules
module use $JEDI_OPT/modulefiles/core
module load jedi/gnu-openmpi
module list

JEDI_EXPERIMENT_DIR=/glade/u/home/afox/work/jedi/jedi_exec_experiments
cd ${JEDI_EXPERIMENT_DIR}

JEDI_BUILD_DIR=/glade/u/home/afox/work/jedi/whj_test/build
echo "JEDI build directory = "${JEDI_BUILD_DIR}

# Define JEDI bin directory where the executables are found
export jedibin=${JEDI_BUILD_DIR}/bin

$jedibin/wrf_hydro_nwm_jedi_var.x config/3dvar_owp.yaml logs/nwm_jedi.log
