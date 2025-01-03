#!/bin/bash
#SBATCH -p short
#SBATCH --export=ALL
#SBATCH -N 1
#SBATCH -n 28
#SBATCH --exclusive
#SBATCH --job-name=bowtie2_testcase_4
#SBATCH --output=output/testcase_4.txt

mkdir -p output src

echo "========================================================"
echo "Job Name: bowtie2_testcase_4"
echo "Job ID: $SLURM_JOB_ID"
echo "Job Node: $(hostname)"
echo "Start Time: $(date)"
echo "========================================================"

echo "Step 1: Creating test reads file 'test_reads.fastq' in /output"
echo "@test_read" > output/test_reads.fastq
echo "ACGTACGTACGT" >> output/test_reads.fastq
echo "+" >> output/test_reads.fastq
echo "IIIIIIIIIIII" >> output/test_reads.fastq

if [ -f output/test_reads.fastq ]; then
    echo "Step 1 Completed: Test reads file created successfully."
    echo "File Details:"
    echo "File Path: $(realpath output/test_reads.fastq)"
    echo "File Content:"
    cat output/test_reads.fastq
else
    echo "Step 1 Failed: Test reads file creation failed."
    echo "End Time: $(date)"
    exit 1
fi

echo "========================================================"
echo "Exiting Compute Node: $(hostname)"
echo "End Time: $(date)"
echo "========================================================"