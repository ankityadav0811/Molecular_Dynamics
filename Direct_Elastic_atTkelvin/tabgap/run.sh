#!/bin/bash
#PBS -N NEP1xAl
#PBS -l select=1:ncpus=40:mem=64gb:scratch_local=100gb
#PBS -l walltime=24:00:00
#PBS -q default@pbs-m1.metacentrum.cz
#PBS -m abe
#PBS -M ankit.yadav@ceitec.vutbr.cz

# Move to the directory where the job was submitted from
cd $PBS_O_WORKDIR

#module purge

export ASE_LAMMPSRUN_COMMAND="mpirun --np 40 ./lammps_tapgap"

# Load necessary modules
#module load python/3.8.10-intel-19.0.4-lxzojgt 

#module load lammps/20230802.3-gcc-10.2.1-hr54yhh 
source  pytorcc_env/bin/activate


mpirun ./lammps_tapgap -in in.elastic > main_log.txt





