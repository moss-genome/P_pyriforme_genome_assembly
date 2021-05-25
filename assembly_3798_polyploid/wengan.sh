#!/bin/bash
#SBATCH --job-name=wengan
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 20
#SBATCH --mem=600G
#SBATCH --partition=himem2
#SBATCH --qos=himem
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kristin.b.anderson@uconn.edu
#SBATCH -o %x_%A.out
#SBATCH -e %x_%A.err

hostname
date

##########################################################
##              Wengan Assembly                           ##
##########################################################

module load perl/5.28.1
module load wengan/0.2

#wengan.pl -l /projects/EBP/Wegrzyn/Moss/ppyriforme/assembly/centrifuge/abv_fungi_unclassified_reads_from_centrifuge/ppyriforme_unclassified_reads_prometh_only.fastq  -p asm_wengan -t 20 -g 3000

singularity exec /isg/shared/apps/wengan/0.2/wengan_v0.2.sif perl /home/FCAM/kanderson/wengan/wengan/wengan.pl \  # donot change anything here, change parameters below
                -x ontraw \
                -l /projects/EBP/Wegrzyn/Moss/ppyriforme/assembly/centrifuge/abv_fungi_unclassified_reads_from_centrifuge/ppyriforme_unclassified_reads_prometh_only.fastq \
                -p asm_wengan -t 20 -g 3000
