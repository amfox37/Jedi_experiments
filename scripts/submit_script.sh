#!/bin/bash
#PBS -N r100h500_swe_exp
#PBS -A NRAL0017
#PBS -l walltime=11:30:00
#PBS -l select=1:ncpus=36:mpiprocs=6
#PBS -q regular
#PBS -j oe
#PBS -m abe
#PBS -M afox@ucar.edu

source /glade/u/apps/ch/opt/lmod/7.2.1/lmod/lmod/init/bash
module purge
export OPT=/glade/work/miesch/modules
module use $OPT/modulefiles/core
module load jedi/gnu-openmpi

JEDI_EXPERIMENT_DIR=/glade/u/home/afox/work/jedi/jedi_exec_experiments
cd ${JEDI_EXPERIMENT_DIR}

./run_3dvar.sh
