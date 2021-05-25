#!/bin/bash
#SBATCH --job-name=shasta_assembly
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 18
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=100G
#SBATCH --mail-user=vidya.vuruputoor@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

module load shasta/0.7.0

shasta --memoryBacking disk --memoryMode filesystem --threads 18 --input /projects/EBP/Wegrzyn/Moss/ppyriforme/assembly/centrifuge/ppyriforme_all_reads.fastq 

shasta --command cleanupBinaryData
