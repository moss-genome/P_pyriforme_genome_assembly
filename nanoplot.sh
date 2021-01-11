#!/bin/bash
#SBATCH --job-name=nanoplot
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=100G
#SBATCH --mail-user=vidya.vuruputoor@uconn.edu
#SBATCH -o nanoplot_%j.out
#SBATCH -e nanoplot_%j.err

module load NanoPlot/1.21.0

NanoPlot -t 8  --minlength 50 --fastq /projects/EBP/CBC/ppyriforme/centrifuge_14813/data/2020OCT13_Goffinet_Pp-14813_flgle_AEL965/20201013_1739_MN17935_AEL965_5ecc6907/fastq_pass/*.fastq
