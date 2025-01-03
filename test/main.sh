#!/bin/bash

mkdir -p output src

sbatch bowtie2_testcase_1.sh
sbatch bowtie2_testcase_2.sh
sbatch bowtie2_testcase_3.sh
sbatch bowtie2_testcase_4.sh
sbatch bowtie2_testcase_5.sh

echo "All jobs have been submitted. Check the output directory for logs and results."
