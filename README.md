# slurm mpi demo

This is a demo for running a very simple python script in parallel within a node and across nodes, using MPI and Slurm. The python script uses `mpi4py`'s `Scatterv` and `Reduce` objects for simply adding up the numbers in an array. The sbatch scripts can be changed to have any configuration of tasks and nodes, but you need to make sure you change the relevant print statements and log output name to reflect the resource configuration. After cloning this repo, there are 2 ways to run these scripts on ilifu. 

### 1. Using a virtual environment and OpenMPI module
Set up a virtual environment
```
> virtualenv mpi_env
> source mpi_env/bin/activate
(mpi_env) > pip install -r requirements.txt
```
An sbatch file that uses this virtual environment will need the following lines after defining the slurm parameters. First load the desired OpenMPI module. Available versions can be shown with `module avail`.
```
module add openmpi/4.0.3
```
Then activate the virtual environment
```
source mpi/bin/activate
```
Finally call the MPI wrapper around the script you want to run
```
mpirun python simple_mpi.py
```
This method requires the OpenMPI module for the MPI wrapper call and the python virtual environment for the mpi4py library which lets us take advantage of MPI calls in python. See the examples of full sbatch files for more clarity on the structure.

### 2. Using a container with OpenMPI installed in it
This method requires that the version and implementation of OpenMPI being used to call the `mpirun` wrapper be the same as that inside the container. For example, the ASTRO-PY3 container has MPICH installed in it, so it's necessary to load the corresponding module when using MPI through this container. The `mpirun` wrapper is simply called around a regular `singularity exec` call as you'd use for a normal job.
```
module add mpich/3.3a2
mpirun singularity exec /idia/software/containers/ASTRO-PY3.simg python simple_mpi.py
```
