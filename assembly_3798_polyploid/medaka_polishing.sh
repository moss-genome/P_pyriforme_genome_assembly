#!/bin/bash
#SBATCH --job-name=medaka_shasta_assembly_ppyriforme_rmv_contam_input
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mem=185G
#SBATCH --mail-user=vidya.vuruputoor@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

#module load python/3.6.3
module load medaka/1.2.0
module unload tabix/0.2.6
module load zlib/1.2.11
module load bcftools/1.9

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/isg/shared/apps/python/3.6.3/lib/
 
medaka_consensus -i /projects/EBP/Wegrzyn/Moss/ppyriforme/assembly/centrifuge/ppyriforme_all_reads.fastq -d /projects/EBP/Wegrzyn/Moss/ppyriforme/assembly/shasta/Shasta_run_minlen_8k/ShastaRun/Assembly.fasta -o medaka_shasta_assembly_ppyriforme_rmv_contam_input_8k -t 40 
