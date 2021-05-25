#!/bin/bash
#SBATCH --job-name=miniasm
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 32
#SBATCH --mem=200G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kristin.b.anderson@uconn.edu
#SBATCH -o %x_%A.out
#SBATCH -e %x_%A.err

hostname
date

##########################################################
##                miniasm assembly                         ##
##########################################################

module load perl/5.28.1
module load unicycler/0.4.8
module load miniasm/0.3
module load minimap2/2.17

path_dir=/projects/EBP/Wegrzyn/Moss/ppyriforme/assembly/centrifuge/abv_fungi_unclassified_reads_from_centrifuge

# Overlap for PacBio reads (or use "-x ava-ont" for nanopore read overlapping)
minimap2 -x ava-pb -t8 $path_dir/ppyriforme_unclassified_reads_prometh_only.fastq $path_dir/ppyriforme_unclassified_reads_prometh_only.fastq | gzip -1 > $path_dir/reads.paf.gz

# Layout
miniasm -f  $path_dir/reads.paf.gz $path_dir/ppyriforme_unclassified_reads_prometh_only.fastq > reads.gfa

awk '/^S/{print ">"$2"\n"$3}' reads.gfa | fold > ppyriforme-miniasm-assembly.fa
 
grep ">" ppyriforme-miniasm-assembly.fa | wc -l








