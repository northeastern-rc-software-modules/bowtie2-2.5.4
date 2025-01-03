#!/bin/bash
#SBATCH -p short
#SBATCH --export=ALL
#SBATCH -N 1
#SBATCH -n 28
#SBATCH --exclusive
#SBATCH --job-name=bowtie2_testcase_2
#SBATCH --output=output/testcase_2.txt

mkdir -p output src

echo "========================================================"
echo "Job Name: bowtie2_testcase_2"
echo "Job ID: $SLURM_JOB_ID"
echo "Job Node: $(hostname)"
echo "Start Time: $(date)"
echo "========================================================"

echo "Step 1: Creating reference genome file 'test_reference.fasta' in /output"
echo ">test_seq" > output/test_reference.fasta
echo "ACGTACGTACGTACGTACGT" >> output/test_reference.fasta

if [ -f output/test_reference.fasta ]; then
    echo "Step 1 Completed: Reference genome created successfully."
    echo "File Details:"
    echo "File Path: $(realpath output/test_reference.fasta)"
    echo "File Content:"
    cat output/test_reference.fasta
else
    echo "Step 1 Failed: Reference genome creation failed."
    echo "End Time: $(date)"
    exit 1
fi

echo "========================================================"
echo "Exiting Compute Node: $(hostname)"
echo "End Time: $(date)"
echo "========================================================"