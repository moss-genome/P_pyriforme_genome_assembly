#!/bin/bash
#SBATCH --job-name=centrifuge_ppyriforme
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=150G
#SBATCH --mail-user=vidya.vuruputoor@uconn.edu
#SBATCH -o centrifuge_%j.out
#SBATCH -e centrifuge_%j.err

module load centrifuge/1.0.4-beta

cd /projects/EBP/CBC/ppyriforme/centrifuge_14813/data/2020OCT13_Goffinet_Pp-14813_flgle_AEL965/20201013_1739_MN17935_AEL965_5ecc6907/fastq_pass/

##cd /projects/EBP/CBC/ppyriforme/data/2020OCT13_Goffinet_Pp-14813_flgle_AEL965/20201013_1739_MN17935_AEL965_5ecc6907/fastq_pass
lst=$(ls *.fastq)
for each in $lst
do
centrifuge --mm -p 8 -x /projects/EBP/CBC/ppyriforme/centrifuge_14813/centrifuge_analysis/1_index/fungi/fungi --report-file centrifuge_fungi.tsv -U /projects/EBP/CBC/ppyriforme/centrifuge_14813/data/2020OCT13_Goffinet_Pp-14813_flgle_AEL965/20201013_1739_MN17935_AEL965_5ecc6907/fastq_pass/${each}
done
