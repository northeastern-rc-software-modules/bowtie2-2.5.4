#!/bin/bash
#SBATCH -p short
#SBATCH --export=ALL
#SBATCH -N 1
#SBATCH -n 28
#SBATCH --exclusive
#SBATCH --job-name=bowtie2_testcase_5
#SBATCH --output=output/testcase_5.txt

mkdir -p output src

echo "========================================================"
echo "Job Name: bowtie2_testcase_5"
echo "Job ID: $SLURM_JOB_ID"
echo "Job Node: $(hostname)"
echo "Start Time: $(date)"
echo "========================================================"

echo "Step 1: Performing alignment with Bowtie2"
bowtie2 -x src/test_index -U output/test_reads.fastq -S output/test_output.sam &> /dev/null

if [ -f output/test_output.sam ]; then
    echo "Step 1 Completed: Alignment successful."
    echo "Output File Path: $(realpath output/test_output.sam)"
else
    echo "Step 1 Failed: Alignment process failed."
    echo "End Time: $(date)"
    exit 1
fi

echo "========================================================"
echo "Exiting Compute Node: $(hostname)"
echo "End Time: $(date)"
echo "========================================================"