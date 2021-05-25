#!/bin/bash
#SBATCH --job-name=buscoi_flye.2.4.2
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=5G
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

module load busco/4.1.2
export AUGUSTUS_CONFIG_PATH=$HOME/Augustus/config/

busco -i ../assembly.fasta -l viridiplantae_odb10 -o Moss_viridi -m genome -f

