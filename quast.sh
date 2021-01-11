#!/bin/bash
#SBATCH --job-name=quast
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=100G
#SBATCH --mail-user=vidya.vuruputoor@uconn.edu
#SBATCH -o quast_%j.out
#SBATCH -e quast_%j.err

module load quast/5.0.2
module rm perl/5.28.0-clean
module load perl/5.28.1

quast.py -r /projects/EBP/CBC/ppyriforme/centrifuge_14813/data/2020OCT13_Goffinet_Pp-14813_flgle_AEL965/20201013_1739_MN17935_AEL965_5ecc6907/fastq_pass/*.fastq
