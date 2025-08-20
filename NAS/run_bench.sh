#!/bin/bash
set -e  # exit if any command fails

mkdir -p /opt/NPB3.4.1/results/omp
# mkdir -p /opt/NPB3.4.1/results/mpi

cd /opt/NPB3.4.1/NPB3.4-OMP/bin

echo "Running OpenMP benchmarks..."
for exe in *.x; do
    echo "Running $exe ..."
    OMP_NUM_THREADS=4 ./"$exe" > "/opt/NPB3.4.1/results/omp/${exe}.txt" 2>&1
done

# echo "Running MPI benchmarks..."
# for exe in *.x; do
#     mpirun -np 4 ./"$exe" > "../results/mpi/${exe}.txt" 2>&1
# done

echo "All benchmarks finished! Results in /opt/NPB3.4.1/results"