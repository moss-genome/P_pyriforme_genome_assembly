#!/bin/bash
#SBATCH --job-name=centrifuge_build
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=100G
#SBATCH -o centrifuge_build_%j.out
#SBATCH -e centrifuge_build_%j.err

module load centrifuge/1.0.4-beta
centrifuge-build -p 8 --conversion-table seqid2taxid.map \
	--taxonomy-tree taxonomy/nodes.dmp --name-table taxonomy/names.dmp \
	input-sequences.fna abv
