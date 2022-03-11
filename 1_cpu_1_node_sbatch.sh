#!/bin/bash

#SBATCH --job-name=demo
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4GB
#SBATCH --time=00:10:00
#SBATCH --output=logs/1-cpu-1-node-%j-stdout.log
#SBATCH --error=logs/1-cpu-1-node-%j-stderr.log

echo "Submitting SLURM job: parallel-std_3.py using 1 core & 1 node"
module add openmpi/4.0.3
source mpi/bin/activate
mpirun python simple_mpi.py
