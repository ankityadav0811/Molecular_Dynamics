#!/bin/bash
#PBS -N niru
#PBS -l nodes=1:ppn=16
#PBS -l mem=5gb

cd $PBS_O_WORKDIR
module add lammps-2Aug2023-MEAM
mpirun -mca btl vader,self  lmp_icc_openmpi -in in.energytemp > main_log.txt
