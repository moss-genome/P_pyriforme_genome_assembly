#!/bin/bash
#SBATCH --job-name=flye_2.8
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=250G
#SBATCH --mail-user=vidya.vuruutoor@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

module load flye/2.8.3

flye --nano-raw /projects/EBP/Wegrzyn/Moss/ppyriforme/assembly/centrifuge/abv_fungi_unclassified_reads_from_centrifuge/ppyriforme_unclassified_reads_prometh_only.fastq --out-dir flye_2.8 --threads 20 --genome-size 550m 
