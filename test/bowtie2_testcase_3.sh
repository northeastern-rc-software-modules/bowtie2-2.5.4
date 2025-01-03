#!/bin/bash
#SBATCH -p short
#SBATCH --export=ALL
#SBATCH -N 1
#SBATCH -n 28
#SBATCH --exclusive
#SBATCH --job-name=bowtie2_testcase_3
#SBATCH --output=output/testcase_3.txt

mkdir -p output src

echo "========================================================"
echo "Job Name: bowtie2_testcase_3"
echo "Job ID: $SLURM_JOB_ID"
echo "Job Node: $(hostname)"
echo "Start Time: $(date)"
echo "========================================================"

echo "Step 1: Building Bowtie2 index using 'test_reference.fasta'"
bowtie2-build output/test_reference.fasta src/test_index &> /dev/null

if [ -f src/test_index.1.bt2 ]; then
    echo "Step 1 Completed: Bowtie2 index built successfully."
    echo "Index Files Path: $(realpath src/)"
else
    echo "Step 1 Failed: Bowtie2 index creation failed."
    echo "End Time: $(date)"
    exit 1
fi

echo "========================================================"
echo "Exiting Compute Node: $(hostname)"
echo "End Time: $(date)"
echo "========================================================"