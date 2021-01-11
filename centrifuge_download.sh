#!/bin/bash
#SBATCH --job-name=centrifuge_download
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=100G
#SBATCH --mail-user=vidya.vuruputoor@uconn.edu
#SBATCH -o centrifuge_download_%j.out
#SBATCH -e centrifuge_download_%j.err

module load centrifuge/1.0.4-beta
module load blast/2.7.1
centrifuge-download -o taxonomy taxonomy
centrifuge-download -o library -m -d "archaea,bacteria,viral" refseq > seqid2taxid.map
