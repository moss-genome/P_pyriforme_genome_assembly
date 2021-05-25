#!/bin/bash
#SBATCH --job-name=minimap_ppyriforme
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=40G
#SBATCH --mail-user=nikisha.patel@uconn.edu
#SBATCH -o minimap_%j.out
#SBATCH -e minimap_%j.err

module load minimap2/2.17

org=/projects/EBP/CBC/ppyriforme/centrifuge_14813/
ref=centrifuge_ref/Physcomitrella_patens.Phypa_V3.dna_sm.toplevel.fa
query=/home/FCAM/npatel/minimap_3798/filtered.fastq 

minimap2 -a $org/$ref $org/$query > alignment.sam
