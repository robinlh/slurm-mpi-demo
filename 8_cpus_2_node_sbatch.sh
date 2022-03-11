#!/bin/bash

#SBATCH --job-name=demo
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=4GB
#SBATCH --time=00:10:00
#SBATCH --output=logs/8-cpus-2-nodes-%j-stdout.log
#SBATCH --error=logs/8-cpus-2-nodes-%j-stderr.log

echo "Submitting SLURM job: simple_mpi.py using 1 core & 1 node"
module add openmpi/4.0.3
source mpi/bin/activate
mpirun python simple_mpi.py
