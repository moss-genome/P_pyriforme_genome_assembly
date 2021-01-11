#!/bin/bash
#SBATCH --job-name=centrifuge_build
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=200G
#SBATCH -o centrifuge_build_%j.out
#SBATCH -e centrifuge_build_%j.err

module load centrifuge/1.0.4-beta
centrifuge-build -p 8 --conversion-table /projects/EBP/CBC/ppyriforme/centrifuge_14813/kraken/plants/kraken_db_plants/seqid2taxid.map \
        --taxonomy-tree /projects/EBP/CBC/ppyriforme/centrifuge_14813/kraken/plants/kraken_db_plants/taxonomy/nodes.dmp --name-table /projects/EBP/CBC/ppyriforme/centrifuge_14813/kraken/plants/kraken_db_plants/taxonomy/names.dmp \
        /projects/EBP/CBC/ppyriforme/centrifuge_14813/centrifuge_analysis/1_index/plants/input-sequences.fna plant
