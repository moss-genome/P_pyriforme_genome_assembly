#!/bin/bash
#SBATCH --job-name=flagstat
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=40G
#SBATCH --mail-user=vidya.vuruputoor@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

module load samtools

samtools flagstat alignment_shasta_promethion.sam
#samtools view alignment_shasta_flongle.bam > alignment_shasta_promethion.bam
