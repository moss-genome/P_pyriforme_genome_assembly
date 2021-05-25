#!/bin/bash
#SBATCH --job-name=centrifuge_ppyriforme
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=40G
#SBATCH --mail-user=nikisha.patel@uconn.edu
#SBATCH -o centrifuge_50_%j.out
#SBATCH -e centrifuge_50_%j.err

module load centrifuge/1.0.4-beta

workingdir=/projects/EBP/Wegrzyn/Moss/ppyriforme/assembly/
indexdir=/projects/EBP/Wegrzyn/Moss/ppyriforme/initial_analysis/centrifuge_14813/centrifuge_analysis/1_index/

centrifuge --mm --min-hitlen 50 --report-file /home/FCAM/npatel/centrifuge_14813/cent2_tsv
 -p 8 -x $indexdir/abv/index/abv
-U /home/FCAM/npatel/2021APR27_Goffinet_14813_flngl_AEL768/2021APR27_Goffinet_14813_flngl_AEL768/20210427_1857_MN17911_AEL768_b19de57e/fastq_pass/all_fastq.fastq
done
