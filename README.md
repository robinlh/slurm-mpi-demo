# slurm mpi demo

This is a demo for running a very simple python script in parallel within a node and across nodes, using MPI and Slurm. The python script uses `mpi4py`'s `Scatterv` and `Reduce` objects for simply adding up the numbers in an array. After cloning this repo, there are 2 ways to run these scripts on ilifu:
