#!/bin/bash
#SBATCH --job-name=parallelAllRun
#SBATCH --time=1:00:00
#SBATCH --ntasks=6
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=2G

module load OpenFOAM/v2106-foss-2021a
. ${FOAM_BASH}

decomposePar
mpirun --mca btl ^openib -np 6 renumberMesh -overwrite -parallel
mpirun --mca btl ^openib -np 6 simpleFoam -parallel
reconstructPar

