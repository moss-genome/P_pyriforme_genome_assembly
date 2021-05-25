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

NanoPlot -t 8  --minlength 50 --fastq /projects/EBP/Wegrzyn/Moss/ppyriforme/assembly/data/2020NOV11_Goffinet_3798A_PAG01750/fastq_pass/*.fastq
