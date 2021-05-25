#!/bin/bash
#SBATCH --job-name=centrifuge_14813
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=160G
#SBATCH --mail-user=nikisha.patel@uconn.edu
#SBATCH -o 2centrifuge_abv_40_%j.out
#SBATCH -e 2centrifuge_abv_40_%j.err

module load centrifuge/1.0.4-beta

cd /projects/EBP/CBC/2021APR27_Goffinet_14813_flngl_AEL768/2021APR27_Goffinet_14813_flngl_AEL768/20210427_1857_MN17911_AEL768_b19de57e/fastq_pass

##cd 
lst=$(ls *.fastq)

for each in $lst

do

centrifuge --min-hitlen 40 --mm -p 8 -x /projects/EBP/Wegrzyn/Moss/ppyriforme/initial_analysis/centrifuge_14813/centrifuge_analysis/1_index/abv/index  -U /projects/EBP/CBC/2021APR27_Goffinet_14813_flngl_AEL768/2021APR27_Goffinet_14813_flngl_AEL768/20210427_1857_MN17911_AEL768_b19de57e/fastq_pass/${each}

done
