#!/bin/bash
#SBATCH -p short
#SBATCH --export=ALL
#SBATCH -N 1
#SBATCH -n 28
#SBATCH --exclusive
#SBATCH --job-name=bowtie2_testcase_1
#SBATCH --output=output/testcase_1.txt

mkdir -p output src

echo "========================================================"
echo "Job Name: bowtie2_testcase_1"
echo "Job ID: $SLURM_JOB_ID"
echo "Job Node: $(hostname)"
echo "Start Time: $(date)"
echo "========================================================"

echo "Step 1: Loading Bowtie2 module and verifying version"
module load bowtie2/2.5.4
bowtie2 --version &> /dev/null

if [ $? -eq 0 ]; then
    echo "Step 1 Completed: Bowtie2 module loaded successfully."
    echo "Bowtie2 Version:"
    bowtie2 --version
else
    echo "Step 1 Failed: Unable to load Bowtie2 module."
    echo "End Time: $(date)"
    exit 1
fi

echo "========================================================"
echo "Exiting Compute Node: $(hostname)"
echo "End Time: $(date)"
echo "========================================================"