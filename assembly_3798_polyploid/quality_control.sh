#!/bin/bash
#SBATCH --job-name=quality_control_medaka_flye.2.8
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

busco -i ../FlyeRun/consensus.fasta -l eukaryota_odb10 -o Moss -m genome -f
busco -i ../FlyeRun/consensus.fasta -l viridiplantae_odb10 -o Moss_viridi -m genome -f

module load quast/5.0.2
quast.py ../FlyeRun/consensus.fasta
