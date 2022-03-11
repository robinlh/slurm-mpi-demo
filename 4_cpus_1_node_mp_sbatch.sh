#!/bin/bash

#SBATCH --job-name=demo
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4GB
#SBATCH --time=00:10:00
#SBATCH --output=logs/demo-%j-stdout.log
#SBATCH --error=logs/demo-%j-stderr.log

echo "Submitting SLURM job: simple_mpi.py using 1 core & 1 node"
module add openmpi/4.0.3
source mpi/bin/activate
mpirun python simple_mp.py
