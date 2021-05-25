#!/bin/bash
#SBATCH --job-name=quast_flye
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=20G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=nikisha.patel@uconn.edu
#SBATCH -o %x_%A.out
#SBATCH -e %x_%A.out

##########################################################
##       QUAST ##
##########################################################
module load quast/5.0.2
quast.py ~/redbean4/wtdbg2/dbg.cns.fa  -o quast_comparison5  --large --k-mer-stats --use-all-alignments --conserved-genes-finding --eukaryote --strict-NA
